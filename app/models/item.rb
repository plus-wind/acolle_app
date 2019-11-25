class Item < ApplicationRecord
  has_many :discs, inverse_of: :item
  has_many :songs, through: :discs
#   accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :discs
  has_many :reviews
  has_many :carts
  has_many :users, through: :carts
  attachment :item_image
	belongs_to :artist
	belongs_to :label
	belongs_to :genre
	is_impressionable counter_cache: true
	has_many :order_items
	has_many :orders, through: :order_items
	has_many :arrivals, dependent: :destroy
	accepts_nested_attributes_for :arrivals
	enum item_delete_flag: { sales: 0, stop: 1 }
end
