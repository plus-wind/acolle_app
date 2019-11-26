class Admins::ItemsController < ApplicationController
	layout "admins"

# protect_from_forgery except: :status

	def index
		@items = Item.all.page(params[:page]).per(10)
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
		@arrivals = Kaminari.paginate_array(@arrivals).page(params[:page]).per(10)
        @order_items = @item.order_items.order('id desc')
        @order_items = Kaminari.paginate_array(@order_items).page(params[:page]).per(10)
        @reviews = @item.reviews.order('id desc')
        @reviews = Kaminari.paginate_array(@reviews).page(params[:page]).per(10)
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
	def edit_search
		if params[:search_flag] == "1"
			@artist_name = Artist.where("artist_name LIKE ?", "%#{params[:search_word]}%")
		elsif params[:search_flag] == "2"
			@label_name = Label.where("label_name LIKE ?", "%#{params[:search_word]}%")
		elsif params[:search_flag] == "3"
			@genre_name = Genre.where("genre_name LIKE ?", "%#{params[:search_word]}%")
		end
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
	def artist_edit
		@artist = Artist.find(params[:id])
	end
	def label_edit
		@label = Label.find(params[:id])
	end
	def genre_edit
		@genre = Genre.find(params[:id])
	end
	def artist_update
        @artist = Artist.find(params[:id])
        @artist.update(artist_params)
		redirect_to new_admins_item_path
	end
	def label_update
        @label = Label.find(params[:id])
        @label.update(label_params)
		redirect_to new_admins_item_path
	end
	def genre_update
        @genre = Genre.find(params[:id])
        @genre.update(genre_params)
		redirect_to new_admins_item_path
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

end
