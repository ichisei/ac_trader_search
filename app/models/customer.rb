class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy

  # def self.search
  #   if params[:area]
  #     areaid = params[:area][:area_ids]
  #     @area = Area.find(areaid)
  #     @traders = @area.traders
  #   else
  #     @traders = Trader.all
  #   end
  #     @areas = Area.all
  # end

end
