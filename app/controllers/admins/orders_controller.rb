class Admins::OrdersController < ApplicationController
    layout "admins"

    def index
    	@orders = Order.all
    end

    def show
    end

    def serch
    end
end
