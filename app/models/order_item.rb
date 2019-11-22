class OrderItem < ApplicationRecord
	def self.rank_sales_items
		self.where(created_at: 1.week.ago.beginning_of_day..Time.zone.now.end_of_day).order('sum_order_number desc').limit(4).group(:item_id).sum(:order_number)
	end

	belongs_to :order
	belongs_to :item
end
