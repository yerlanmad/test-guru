class Test < ApplicationRecord
  def self.titles(category)
    Test.joins("INNER JOIN categories ON tests.category_id = categories.id").where(categories: { category: category }).order(title: :desc).pluck(:title)
  end
end
