class Area < ApplicationRecord
  
  has_many :trader_areas, dependent: :destroy
  has_many :traders, through: :trader_areas
  
end
