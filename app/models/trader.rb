class Trader < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :trader_areas, dependent: :destroy
  has_many :areas, through: :trader_areas

  has_many :trader_machines, dependent: :destroy
  has_many :machines, through: :trader_machines

  has_many :posts, dependent: :destroy

  has_many :schedules, dependent: :destroy

  has_one_attached :profile_image

  def get_profile_image(width, height)
  unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/AC.png')
    profile_image.attach(io: File.open(file_path), filename: 'no-image.png', content_type: 'image/png')
  end
    profile_image
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

end