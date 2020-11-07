class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: "User", optional: true
  has_many :questions, dependent: :destroy
  has_many :test_histories, dependent: :destroy
  has_many :users, through: :test_histories
  
  def self.titles(category)
    joins(:category).where(categories: { category: category })
      .order(title: :desc)
      .pluck(:title)
  end
end
