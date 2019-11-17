class Item < ApplicationRecord
<<<<<<< HEAD
  has_many :carts
  has_many :users, through: :carts

  attachment :item_image
=======
	belongs_to :artist
	belongs_to :label
	belongs_to :genre
	attachment :item_image
	is_impressionable counter_cache: true
    has_many :carts
    has_many :users, through: :carts
>>>>>>> 277f95ace9f2d7a87a57544e5b753499dfc92712
end
