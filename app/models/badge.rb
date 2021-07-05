class Badge < ApplicationRecord
  belongs_to :category, optional: true
  has_many :users, through: :achievements
end
