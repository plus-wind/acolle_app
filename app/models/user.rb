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
end
