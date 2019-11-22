class Admins::ItemsController < ApplicationController
	def index
	end
	def show
		@item = Item.find(params[:id])
		@arrival = Arrival.new
        @arrivals_sum =  Arrival.where(item_id: @item.id).sum(:arrival_number)
        @order_items_sum = OrderItem.where(item_id: @item.id).sum(:order_number)
	end
	def edit
		@item = Item.find(params[:item_id])
	end
end
