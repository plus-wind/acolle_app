class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :addresses
  has_many :carts
  has_many :items, through: :carts
  has_many :orders
  has_many :order_items, through: :orders
  has_many :reviews

  ratyrate_rater

  def self.find_first_by_auth_conditions(warden_conditions)
    User.where(:email => warden_conditions[:email],:delete_flag=>0).first
  end

  validates :name_family_kanji, presence: true
  validates :name_first_kanji, presence: true
  VALID_NAME_FURIGANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :name_family_furigana, presence: true, uniqueness: true, format: { with: VALID_NAME_FURIGANA_REGEX }
  validates :name_first_furigana, presence: true, uniqueness: true, format: { with: VALID_NAME_FURIGANA_REGEX }
  validates :postal_code, presence: true, length: { is: 7 }
  validates :address_prefecture, presence: true
  validates :address_city, presence: true
  validates :address_number, presence: true
  validates :phone_number, presence: true
end
