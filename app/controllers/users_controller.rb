class UsersController < ApplicationController

	def show
	  @user = current_user
	  @addresses = Address.where(user_id: current_user)
	end
end
