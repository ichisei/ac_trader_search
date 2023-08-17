class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy

  GUEST_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_EMAIL) do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.last_name = "guest"
      customer.first_name = "customer"
      customer.last_name_kana = "guest"
      customer.first_name_kana = "customer"
    end
  end


end
