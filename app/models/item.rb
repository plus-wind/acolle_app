class Item < ApplicationRecord
  has_many :discs
  has_many :reviews
  has_many :carts
  has_many :users, through: :carts
  attachment :item_image
	belongs_to :artist
	belongs_to :label
	belongs_to :genre
	is_impressionable counter_cache: true
end
