class Item < ApplicationRecord
	belongs_to :artist
	belongs_to :label
	belongs_to :genre
	attachment :item_image
	is_impressionable counter_cache: true
    has_many :carts
    has_many :users, through: :carts
    has_many :discs
end
