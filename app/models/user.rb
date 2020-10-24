class User < ApplicationRecord
  def accepted_tests(level)
    TestHistory.joins(:test, :user).where("users.id = :id and level = :level", id: self.id, level: level).pluck("tests.title")
  end
end
