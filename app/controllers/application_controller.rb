class ApplicationController < ActionController::Base
	before_action :set_search


	before_action :configure_permitted_parameters, if: :devise_controller?


	def set_search
		@search = Item.ransack(params[:q])
		@search_items = @search.result
	end


	protect_from_forgery with: :exception

	helper_method :current_cart

	def current_cart
	  if session[:cart_id]
		@cart = Cart.find(session[:cart_id])
	  else
		@cart = Cart.create
		session[:cart_id] = @cart.id
	  end
	end

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
		devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:name, :password)}
	end

	def after_update_path_for(resource)
      mypage_path
    end


	def after_sign_out_path_for(resource)
		flash[:notice] = "Signed out successfully."
		root_path
	end

	def authenticate_user
		if current_user == nil
			redirect_to new_user_session_path
		end
	end

	def set_current_user
		current_user = User.find_by(id: session[:user_id])
	end

end
