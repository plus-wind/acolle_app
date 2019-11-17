class OrderItem < ApplicationRecord
	def self.rank_sales_items
		self.order('sum_order_number desc').limit(4).group(:item_id).sum(:order_number)
	end

end
