class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_belong_count, on: :create

  scope :correct, -> { where(correct: true) }

  def validate_belong_count
    errors.add(:answers, "too much") if question.answers.count >= 4
  end
end
