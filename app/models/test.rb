class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: "User", optional: true
  has_many :questions, dependent: :destroy
  has_many :test_histories, dependent: :destroy
  has_many :users, through: :test_histories

  validates :title, presence: true, 
    uniqueness: { scope: :level, message: "should be one level for title" }
  validates :level, numericality: { greater_than_or_equal_to: 0}

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :by_level, -> (level) { where(level: level) }
  
  scope :titles_by_category, -> (category) {
    select(:title).joins(:category).where(categories: {title: category})
      .order(title: :desc)
  }
end
