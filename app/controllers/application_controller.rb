class ApplicationController < ActionController::Base
	before_action :set_search


	before_action :configure_permitted_parameters, if: :devise_controller?


	def set_search
		@search = Item.ransack(params[:q])
		@search_items = @search.result
	end

	protected


	def after_sign_out_path_for(resource)
		root_path
	end

	def set_current_user
		current_user = User.find_by(id: session[:user_id])
	end

end
