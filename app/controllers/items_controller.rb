class ItemsController < ApplicationController
	def index
		@items = Item.all
		@hash_sales_ranking = OrderItem.rank_sales_items
		@most_viewed = Item.order('impressions_count DESC').take(4)
	end
	def show
		@item = Item.find(params[:id])
	    impressionist(@item, nil)
	end
end
