class TestPassage < ApplicationRecord
  PASS_RATE = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    
    self.passed = true if is_passed?
    save!
  end

  def question_index
    test.questions.ids.sort.index(current_question.id) + 1
  end

  def rate
    correct_questions / test.questions.count.to_f * 100
  end

  def is_passed?
    rate >= PASS_RATE
  end

  def attempts_count
    TestPassage.where(test_id: test_id, user_id: user_id).count
  end

  def all_in_category?
    category_tests = Test.where(category_id: test.category_id).ids
    passed_tests = user.test_passages.where(passed: true).pluck(:test_id)
    (category_tests - passed_tests).empty?
  end

  def all_in_level?
    level_tests = Test.where(level: test.level).ids
    passed_tests = user.test_passages.where(passed: true).pluck(:test_id)
    (level_tests - passed_tests).empty?
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_update_set_next_question
    self.current_question = next_question unless completed?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids&.map(&:to_i)&.sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
