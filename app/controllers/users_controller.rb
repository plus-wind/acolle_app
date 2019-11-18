class UsersController < ApplicationController

	def show
	  @user = current_user
	  @addresses = Address.where(user_id: @user)
	  @orders = @user.orders
	  @order_items = OrderItem.where(user_id: @user)
	end
end
