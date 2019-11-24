class ApplicationController < ActionController::Base

	#before_action :configure_permitted_parameters, if: :devise_controller?

protect_from_forgery with: :exception
autocomplete :artist, :artist_name, full: true
autocomplete :label, :label_name, full: true
autocomplete :genre, :genre_name, full: true

	def search
		@temp = 1
		@hash_sales_ranking = OrderItem.rank_sales_items
		@item_sales_key = @hash_sales_ranking.keys
		@item_sales_ranking = []
		@item_sales_key.each do |i|
			item  = Item.find(i)
			if item.item_delete_flag_before_type_cast == 0
				@item_sales_ranking << item
			    if @item_sales_ranking.count == 5
				   return
			    end
			end
		end
		@hash_most_viewed_impression = Impression.where(created_at: 1.week.ago.beginning_of_day..Time.zone.now.end_of_day).limit(5).group(:impressionable_id).order('count_impressionable_id desc').count(:impressionable_id)
		@item_view_keys = @hash_most_viewed_impression.keys
		@item_view_ranking = []
		@item_view_keys.each do |i|
			item  = Item.find(i)
			if item.item_delete_flag_before_type_cast == 0
				@item_view_ranking << item
			    if @item_view_ranking.count == 5
				   return
			    end
			end
		end
		if params[:search_flag] == "1"
			@artists = Artist.where("artist_name LIKE ?", "%#{params[:search_word]}%")
			@items = []
			@artists.each do |a|
				a.items.where(item_delete_flag: 0).each do |i|
					@items << i
				end
			end
			@items = @items.reverse
			@items = Kaminari.paginate_array(@items).page(params[:page]).per(3)
			@day = Date.today.strftime('%y/%m/%d')
			@week_ago = Date.today.ago(1.week).strftime('%y/%m/%d')
		elsif params[:search_flag] == "2"
			@items = Item.where(item_delete_flag: 0).joins(discs: :songs).where("song LIKE ?", "%#{params[:search_word]}%")
			@items = @items.reverse.uniq
			@items = Kaminari.paginate_array(@items).page(params[:page]).per(3)
			@day = Date.today.strftime('%y/%m/%d')
			@week_ago = Date.today.ago(1.week).strftime('%y/%m/%d')
		end
		render :index
	end

	protected
	# def configure_permitted_parameters
	# 	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
	# 	devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:name, :password)}
	# end



	# def after_update_path_for(resource)
 #      mypage_path
 #    end


	# def after_sign_out_path_for(resource)
	# 	root_path
	# end
	# def authenticate_user
	# 	if current_user == nil
	# 		redirect_to new_user_session_path
	# 	end
	# end

	def set_current_user
		current_user = User.find_by(id: session[:user_id])
	end

end
