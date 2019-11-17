class Item < ApplicationRecord
  has_many :carts
  has_many :users, through: :carts

  attachment :item_image
	belongs_to :artist
	belongs_to :label
	belongs_to :genre
	attachment :item_image
	is_impressionable counter_cache: true
    has_many :carts
    has_many :users, through: :carts
end
