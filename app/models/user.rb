class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test", foreign_key: "author_id",
    dependent: :nullify

  validates :first_name, :last_name, :email, presence: true

  def passed_tests_by_level(level)
    tests.by_level(level).distinct
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
