class Badge < ApplicationRecord
  belongs_to :category, optional: true
end
