class Admins::ItemsController < ApplicationController
	layout "admins"

# protect_from_forgery except: :status

	def index
		@items = Item.all
		@sums = []
		@items.each do |item|
			@arrival_sums = Arrival.where(item_id: item.id).sum(:arrival_number)
			@order_items_sums = OrderItem.where(item_id: item.id).sum(:order_number)
			@sums << (@arrival_sums - @order_items_sums)
		end
		@arrival = Arrival.new
			# @arrivals_sum = Arrival.where(item_id: @item.id).sum(:arrival_number)
			# @order_items_sum = OrderItem.where(item_id: @item.id).sum(:order_number)
	end
	def show
		@item = Item.find(params[:id])
		@arrival = Arrival.new
        @arrivals_sum =  Arrival.where(item_id: @item.id).sum(:arrival_number)
        @order_items_sum = OrderItem.where(item_id: @item.id).sum(:order_number)
	end
	def edit
		@item = Item.find(params[:id])
		@disc = @item.discs
		# @song = @disc.songs

	end
	def status
		@item = Item.find(params[:id])
		if @item.item_delete_flag_before_type_cast == 0
        	@item.update(item_delete_flag: 1)
    	elsif @item.item_delete_flag_before_type_cast == 1
        	@item.update(item_delete_flag: 0)
    	end
	end

private
	# def item_params
	# 	params.require(:item).permit(:item_name, :description, discs_attributes: [:id, :description, :done, :_destroy, songs_attributes: [:id, :description, :_destroy]])
    # end

	# private
	# def item_params
	# 	params.require(:item).permit(:, :body)
	# end
end
