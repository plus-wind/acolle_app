class Admins::ItemsController < ApplicationController
	layout "admins"

# protect_from_forgery except: :status

	def index
		@items = Item.all
		@sums = []
		@items.each do |item|
			@arrival_sums = Arrival.where(item_id: item.id).sum(:arrival_number)
			@order_items_sums = OrderItem.where(item_id: item.id).sum(:order_number)
			@sums << (@arrival_sums - @order_items_sums)
		end
		@arrival = Arrival.new
			# @arrivals_sum = Arrival.where(item_id: @item.id).sum(:arrival_number)
			# @order_items_sum = OrderItem.where(item_id: @item.id).sum(:order_number)
	end
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
	def new
		@item = Item.new
		@item.arrivals.build
		@disc = @item.discs.build
		@song = @disc.songs.build
		@artists = Artist.all
		@labels = Label.all
		@genres = Genre.all
		@artist = Artist.new
		@label = Label.new
		@genre = Genre.new
	end
	def create
		item = Item.new(item_params)
		artist = Artist.where("artist_name = '#{params[:item][:artist_id]}'").first
		item.artist_id = artist.id
		label = Label.where("label_name = '#{params[:item][:label_id]}'").first
		item.label_id = label.id
		genre = Genre.where("genre_name = '#{params[:item][:genre_id]}'").first
		item.genre_id = genre.id
		item.save
		redirect_to new_admins_item_path
	end
	def artist_create
		artist = Artist.new(artist_params)
		artist.save
		@item = Item.new
		@item.arrivals.build
		@disc = @item.discs.build
		@song = @disc.songs.build
		@artists = Artist.all
		@labels = Label.all
		@genres = Genre.all
		@artist = Artist.new
		@label = Label.new
		@genre = Genre.new
		render :new
	end
	def label_create
		label = Label.new(label_params)
		label.save
		@item = Item.new
		@item.arrivals.build
		@disc = @item.discs.build
		@song = @disc.songs.build
		@artists = Artist.all
		@labels = Label.all
		@genres = Genre.all
		@artist = Artist.new
		@label = Label.new
		@genre = Genre.new
		render :new
	end
	def genre_create
		genre = Genre.new(genre_params)
		genre.save
		@item = Item.new
		@item.arrivals.build
		@disc = @item.discs.build
		@song = @disc.songs.build
		@artists = Artist.all
		@labels = Label.all
		@genres = Genre.all
		@artist = Artist.new
		@label = Label.new
		@genre = Genre.new
		render :new
	end

private
	def item_params
		params.require(:item).permit(:item_name, :item_type, :item_image, :item_price, :artist_id, :label_id, :genre_id, :item_release_date, :item_delete_flag, arrivals_attributes: [:arrival_number, :arrival_date],  discs_attributes: [:id, :disc_name, :_destroy, songs_attributes: [:id, :song, :_destroy]])
	end
	def artist_params
		params.require(:artist).permit(:artist_name)
	end
	def label_params
		params.require(:label).permit(:label_name)
	end
	def genre_params
		params.require(:genre).permit(:genre_name)
	end



	# def item_params
	# 	params.require(:item).permit(:item_name, :item_type, :item_image, :item_price)
	# end
	# private
	# def item_params
	# 	params.require(:item).permit(:, :body)
	# end
end
