class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"
  has_many :questions
  has_many :test_histories
  has_many :users, through: :test_histories
  
  def self.titles(category)
    joins("JOIN categories ON tests.category_id = categories.id")
      .where(categories: { category: category })
      .order(title: :desc)
      .pluck(:title)
  end
end
