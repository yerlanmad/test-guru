class Badge < ApplicationRecord
  belongs_to :category, optional: true
  has_many :users, through: :achievements

  scope :first_attempt, -> { where(first_attempt: true) }
  scope :all_in_category, ->(category) { where(all_in_category: true, category_id: category) }
  scope :all_in_level, ->(level) { where(all_in_level: true, level: level) }
end
