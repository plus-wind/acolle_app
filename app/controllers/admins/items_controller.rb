class Admins::ItemsController < ApplicationController
	layout "admins"

# protect_from_forgery except: :status

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
	def status
		@item = Item.find(params[:id])
		if @item.item_delete_flag == 1
        	@item.update(item_delete_flag: 0)
    	elsif @item.item_delete_flag == 0
        	@item.update(item_delete_flag: 1)
    	end
	end
end
