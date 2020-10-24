class Test < ApplicationRecord
  belongs_to :category

  def self.titles(category)
    Test.joins(:category).where("categories.category = :category", category: category).order(title: :desc).pluck(:title)
  end
end
