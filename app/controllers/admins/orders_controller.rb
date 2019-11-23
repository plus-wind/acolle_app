class Admins::OrdersController < ApplicationController
    layout "admins"

    def index
    	@orders = Order.all
    	@order_item = OrderItem.all
    	@items = Item.all
    end

    def show
    end

    def serch
    end
end
