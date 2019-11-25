class Admins::ItemsController < ApplicationController
	layout "admins"

# protect_from_forgery except: :status

	def index
		@items = Item.all
		@sums = []
		@orderednumber = []
		@items.each do |item|
			@arrival_sums = Arrival.where(item_id: item.id).sum(:arrival_number)
			@order_items_sums = OrderItem.where(item_id: item.id).sum(:order_number)
			@sums << (@arrival_sums - @order_items_sums)
			@orderednumber << (item.order_items.where(created_at: 1.week.ago.beginning_of_day..Time.zone.now.end_of_day).sum(:order_number))
		end
	end

	# def sort
	# 	# 在庫数
	# 	if params[:sort_type] == "1" && params[:sort_flag] == "1"
	# 		@items = Item.all.order('created_at ASC').page(params[:page]).per(2)
	# 		render :index
	# 	elsif params[:sort_type] == "1" && params[:sort_flag] == "2"
	# 		@reviews = Review.all.order('created_at DESC').page(params[:page]).per(2)
	# 		render :index
	# 	# 閲覧数
	# 	elsif params[:sort_type] == "2" && params[:sort_flag] == "1"
	# 		@reviews = Review.all.order('satisfaction ASC').page(params[:page]).per(2)
	# 		render :index
	# 	elsif params[:sort_type] == "2" && params[:sort_flag] == "2"
	# 		@reviews = Review.all.order('satisfaction DESC').page(params[:page]).per(2)
	# 		render :index
	# 	# 週間売り上げ枚数
	# 	elsif params[:sort_type] == "3" && params[:sort_flag] == "1"
	# 		@reviews = Review.all.order('satisfaction ASC').page(params[:page]).per(2)
	# 		render :index
	# 	elsif params[:sort_type] == "3" && params[:sort_flag] == "2"
	# 		@reviews = Review.all.order('satisfaction DESC').page(params[:page]).per(2)
	# 		render :index
	# 	end
	# end

	# def search
	# 	if params[:search_flag] == "1"
	# 		@artists = Artist.where("artist_name LIKE ?", "%#{params[:search_word]}%")
	# 		# binding.pry
	# 		@items = [] 								#配列の箱作成
	# 		@artists.each do |a|				#検索したアーティストを繰り返す
	# 			a.items.where(item_delete_flag: 0).each do |i|
	# 				@items << i
	# 			end
	# 		end
	# 	elsif params[:search_flag] == "2"
	# 		@items = Item.where("item_name LIKE ?", "%#{params[:search_word]}%")
	# 		@items = @items.reverse.uniq
	# 		@items = Kaminari.paginate_array(@items).page(params[:page]).per(3)
	# 	end
	# 	render :index

	def show
		@item = Item.find(params[:id])
		@arrival = Arrival.new
        @arrivals_sum =  Arrival.where(item_id: @item.id).sum(:arrival_number)
        @order_items_sum = OrderItem.where(item_id: @item.id).sum(:order_number)
        @arrivals = @item.arrivals.order('id desc')
		@arrivals = Kaminari.paginate_array(@arrivals).page(params[:page]).per(1)
        @order_items = @item.order_items.order('id desc')
        @order_items = Kaminari.paginate_array(@order_items).page(params[:page]).per(1)
        @reviews = @item.reviews.order('id desc')
        @reviews = Kaminari.paginate_array(@reviews).page(params[:page]).per(1)
	end

	def edit
		@item = Item.find(params[:id])
		@disc = @item.discs
		# @song = @disc.songs
	end
	def status
		@item = Item.find(params[:id])
		if @item.item_delete_flag_before_type_cast == 0
			@item.update(item_delete_flag: 1)
    elsif @item.item_delete_flag_before_type_cast == 1
      @item.update(item_delete_flag: 0)
    end
	end

	def update
		@item = Item.find(params[:id])
		if @item.update(item_params)
			flash[:notice] = "You have updated item successfully."
			redirect_to admins_item_path(@item.id)
		 else
			render :edit
		 end
	 end

private
	def item_params
		params.require(:item).permit(:item_name, :item_type, :item_image, :item_price, discs_attributes: [:id, :disc_name, :_destroy, songs_attributes: [:id, :song, :_destroy]])
	end
end
