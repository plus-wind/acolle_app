class OrderItem < ApplicationRecord
	def self.rank_sales_items
		self.order('sum_order_number desc').limit(4).group(:item_id).sum(:order_number)
	end

	belongs_to :order, optional: true
	belongs_to :item, optional: true
end
