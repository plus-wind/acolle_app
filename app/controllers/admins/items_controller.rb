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
	end
	def edit
		@item = Item.find(params[:id])
		# @disc = @item.discs
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
		@artist = Artist.find(params[:artist][:id])
		@artist.update!(artist_params)
		@label = Label.find(params[:artist][:id])
		@label.update!(label_params)
		@genre = Genre.find(params[:artist][:id])
		@genre.update!(genre_params)
		params[:item][:disc].each do |key,disc|
			@disc = Disc.find(key.to_i)
			@disc.update!({
				disc_name: disc[:disc_name]
			})
			disc[:song].each do |key, song|
				@song = Song.find(key.to_i)
				@song.update!({
					song: song[:song]
				})
			end
		end
		# @disc.update!(disc_params)
		# @song = Song.find(params[:id])
		# @song.update!(song_params)
		if @item.update(item_params)
			flash[:notice] = "編集完了"
			redirect_to admins_item_path(@item.id)
		 else
			render :edit
		 end
	end

private
	def item_params
		params.require(:item).permit(:item_name, :item_type, :item_image, :item_price, :item_release_date, :artist_name, :genre_name, :label_name, discs_attributes: 
			[:disc_name, songs_attributes: 
				[:id, :song]
			]
		)
		# params.require(:item).permit(:item_name, :item_type, :item_image, :item_price, :item_release_date, :artist_name, :genre_name, :label_name, discs_attributes: 
		# 	[:disc_name]
		# )
	end

	def artist_params
		params.require(:artist).permit(:id, :artist_name)
	end
	def label_params
		params.require(:label).permit(:id, :label_name)
	end
	def genre_params
		params.require(:genre).permit(:id, :genre_name)
	end


	# private
	# def item_params
	# 	params.require(:item).permit(:, :body)
	# end
end
