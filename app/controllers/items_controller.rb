class ItemsController < ApplicationController
	def index
		@items = Item.all
		@hash_sales_ranking = OrderItem.rank_sales_items
	end
end