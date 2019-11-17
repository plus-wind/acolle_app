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
	def search
		@hash_sales_ranking = OrderItem.rank_sales_items
		@most_viewed = Item.order('impressions_count DESC').take(4)
		if params[:search_flag] == "1"
			@artists = Artist.joins(:items).where("artist_name LIKE ?", "%#{params[:search_word]}%")
			@artists.id = @items.artist_id
		elsif params[:search_flag] == "2"
			@items = Item.joins(discs: :songs).where("song LIKE ?", "%#{params[:search_word]}%")
		end
		render :index
	end
end
