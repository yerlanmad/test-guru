class User < ApplicationRecord
  has_many :test_histories, dependent: :destroy
  has_many :tests, through: :test_histories
  has_many :created_tests, class_name: "Test", foreign_key: "author_id",
    dependent: :nullify
  
  def passed_tests_by_level(level)
    tests.where(level: level)
  end
end
