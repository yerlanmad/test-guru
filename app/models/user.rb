class User < ApplicationRecord
  def accepted_tests(level)
    user_tests = TestHistory.where(user_id: self.id)
    Test.where(id: user_tests).where(level: level)
  end
end
