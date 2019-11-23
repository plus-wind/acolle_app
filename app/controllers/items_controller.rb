class ItemsController < ApplicationController
	def index
		@items = Item.page(params[:page]).where(item_delete_flag: 0).per(3).reverse_order
		@hash_sales_ranking = OrderItem.rank_sales_items
        @hash_most_viewed_impression = Impression.where(created_at: 1.week.ago.beginning_of_day..Time.zone.now.end_of_day).group(:impressionable_id).order('count_impressionable_id desc').count(:impressionable_id)
		@day = Date.today.strftime('%y/%m/%d')
		@week_ago = Date.today.ago(1.week).strftime('%y/%m/%d')
	end
	# ApplicationControllerへ
	# def search
	# 	@hash_sales_ranking = OrderItem.rank_sales_items
	# 	@most_viewed = Item.order('impressions_count DESC').take(4)
	# 	if params[:search_flag] == "1"
	# 		@artists = Artist.where("artist_name LIKE ?", "%#{params[:search_word]}%")
	# 		@items = []
	# 		@artists.each do |a|
	# 			a.items.each do |i|
	# 				@items << i
	# 			end
	# 		end
	# 		@items = @items.reverse
	# 		@items = Kaminari.paginate_array(@items).page(params[:page]).per(3)
	# 		@day = Date.today.strftime('%y/%m/%d')
	# 		@week_ago = Date.today.ago(1.week).strftime('%y/%m/%d')
	# 	elsif params[:search_flag] == "2"
	# 		@items = Item.joins(discs: :songs).where("song LIKE ?", "%#{params[:search_word]}%")
	# 		@items = @items.reverse.uniq
	# 		@items = Kaminari.paginate_array(@items).page(params[:page]).per(3)
	# 		@day = Date.today.strftime('%y/%m/%d')
	# 		@week_ago = Date.today.ago(1.week).strftime('%y/%m/%d')
	# 	end
	# 	render :index
	# end
	def show
		@item = Item.find(params[:id])
		@reviews = @item.reviews
	    impressionist(@item, nil)
	    @cart = Cart.new
        @satisfaction_average = @item.reviews.average(:satisfaction)
        @satisfaction_count = @item.reviews.length
        @reviews = @item.reviews.reverse
        @reviews = Kaminari.paginate_array(@reviews).page(params[:page]).per(3)
        @arrivals_sum =  Arrival.where(item_id: @item.id).sum(:arrival_number)
        @order_items_sum = OrderItem.where(item_id: @item.id).sum(:order_number)
	end
end