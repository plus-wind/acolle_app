class CartsController < ApplicationController
	def add
	end


	private
    def cart_params
        params.require(:cart).permit(:user_id, :item_id, :cart_item_number)
    end
end


