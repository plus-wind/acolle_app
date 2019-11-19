class ItemsController < ApplicationController
	def index
		@items = Item.page(params[:page]).per(3).reverse_order
		@hash_sales_ranking = OrderItem.rank_sales_items
		@most_viewed = Item.order('impressions_count DESC').take(4)
	end
	def search
		@hash_sales_ranking = OrderItem.rank_sales_items
		@most_viewed = Item.order('impressions_count DESC').take(4)
		if params[:search_flag] == "1"
			@artists = Artist.where("artist_name LIKE ?", "%#{params[:search_word]}%")
			@items = [].page(params[:page]).per(3).reverse_order
			@artists.each do |a|
				a.items.each do |i|
					@items << i
				end
			end
		elsif params[:search_flag] == "2"
			@items = Item.joins(discs: :songs).where("song LIKE ?", "%#{params[:search_word]}%").page(params[:page]).per(3).reverse_order
		end
		render :index
	end
	def show
		@item = Item.find(params[:id])
		@reviews = @item.reviews
	    impressionist(@item, nil)
	    @cart = Cart.new
        @satisfaction_average = @item.reviews.average(:satisfaction)
        @satisfaction_count = @item.reviews.length
	end
end