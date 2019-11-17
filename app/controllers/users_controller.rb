class UsersController < ApplicationController

	def show
	  @user = current_user
	  @addresses = Address.where(user_id: current_user)
	  @order = Order.where(user_id: current_user)
	  @order_items = OrderItems.where(user_id: current_user)
	end
end
