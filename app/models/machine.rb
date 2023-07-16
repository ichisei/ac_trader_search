class Machine < ApplicationRecord
  
  has_many :trader_machines, dependent: :destroy
  has_many :traders, through: :trader_machines
  
end
