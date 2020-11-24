class User < ApplicationRecord
  has_many :test_histories, dependent: :destroy
  has_many :tests, through: :test_histories
  has_many :created_tests, class_name: "Test", foreign_key: "author_id",
    dependent: :nullify

  validates :first_name, :last_name, :email, presence: true

  def passed_tests_by_level(level)
    tests.by_level(level).distinct
  end
end
