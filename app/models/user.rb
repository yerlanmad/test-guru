class User < ApplicationRecord
  def accepted_tests(level)
    Test.joins("INNER JOIN test_histories ON test_histories.test_id = tests.id").where(level: level, test_histories: { user_id: self.id }).distinct
  end
end
