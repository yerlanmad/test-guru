class Test < ApplicationRecord
  def self.test_names(category_name)
    category_id = Category.find_by(category: category_name).id
    self.where(category_id: category_id).order(title: :desc).pluck(:title)
  end
end
