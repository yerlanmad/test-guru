class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: "User", optional: true
  has_many :questions, dependent: :destroy
  has_many :test_histories, dependent: :destroy
  has_many :users, through: :test_histories

  scope :by_complexity, -> (complexity) {
    case complexity
    when :easy
      where(level: 0..1)
    when :medium
      where(level: 2..4)
    when :hard
      where(level: 5..Float::INFINITY)
    else
      none
    end
  }

  scope :by_level, -> (level) { where(level: level) }
  
  scope :titles_by_category, -> (category) {
    select(:title).joins(:category).where(categories: {title: category})
      .order(title: :desc)
  }
end
