class Product < ApplicationRecord
  validates :name,
            presence: true

  validates :unit,
            presence: true
end
