class UsersController < ApplicationController

	def show
	  @user = current_user
	  @addresses = Address.where(user_id: @user)
	  @orders = @user.orders
	end

	def retire
	  user = current_user
	  user.update(delete_flag: 1)
	  Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
	  redirect_to users_unsubscribe_complete_path
	end
end

