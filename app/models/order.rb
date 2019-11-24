class Order < ApplicationRecord
	has_many :order_items
	has_many :items, through: :order_items
	belongs_to :user
	enum order_status: { checked: 0, ongoing: 1, shipped: 2 }
