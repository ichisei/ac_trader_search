class Area < ApplicationRecord
  
  has_many :trader_areas
  has_many :traders, through: :trader_areas
  
end
