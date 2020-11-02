class User < ApplicationRecord
  has_many :test_histories
  has_many :tests, through: :test_histories
  has_many :created_tests, class_name: "Test", foreign_key: "author_id"
  
  def passed_tests_by_level(level)
    Test.joins("JOIN test_histories ON test_histories.test_id = tests.id")
      .where(level: level, test_histories: { user_id: self.id })
      .distinct
  end
end
