class ApplicationController < ActionController::Base


	#before_action :configure_permitted_parameters, if: :devise_controller?

	def search
		@temp = 1
		@hash_sales_ranking = OrderItem.rank_sales_items
		@most_viewed = Item.order('impressions_count DESC').take(4)
		if params[:search_flag] == "1"
			@artists = Artist.where("artist_name LIKE ?", "%#{params[:search_word]}%")
			@items = []
			@artists.each do |a|
				a.items.each do |i|
					@items << i
				end
			end
			@items = @items.reverse
			@items = Kaminari.paginate_array(@items).page(params[:page]).per(3)
		elsif params[:search_flag] == "2"
			@items = Item.joins(discs: :songs).where("song LIKE ?", "%#{params[:search_word]}%")
			@items = @items.reverse.uniq
			@items = Kaminari.paginate_array(@items).page(params[:page]).per(3)
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
