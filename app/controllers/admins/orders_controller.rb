class Admins::OrdersController < ApplicationController
    layout "admins"

    def index
    	@orders = Order.all.order("id DESC").page(params[:page]).per(20)
    end

    def search
    	if params[:search_flag] == "1"
	  		@orders = Order.where("id LIKE ?", "#{params[:search_word]}")
	  		@orders = Kaminari.paginate_array(@orders).page(params[:page]).per(20)
		elsif params[:search_flag] == "2"
			@orders = Order.where("date(order_date) LIKE ?", "%#{params[:search_word]}%")
			@orders = Kaminari.paginate_array(@orders).page(params[:page]).per(20)
		elsif params[:search_flag] == "3"
			@items = Item.where("item_name LIKE ?", "%#{params[:search_word]}%")
			@orders = []
     		@items.each do |item|
        		item.orders.each do |order|
          			@orders << order
        		end
     		end
     		@orders = Kaminari.paginate_array(@orders).page(params[:page]).per(20)
		else
			@orders = Order.where("order_status LIKE ?", "%#{params[:status]}%").order("id DESC")
			@orders = Kaminari.paginate_array(@orders).page(params[:page]).per(20)
		end
		render :index
    end

    def sort
    	if params[:sort_type] == "1"
	      @orders = Order.all.order('id DESC').page(params[:page]).per(20)
	      render :index
	    elsif params[:sort_type] == "2"
	      @orders = Order.all.order('date(order_date) DESC').page(params[:page]).per(20)
	      render :index
	    end
    end

    def change
		@orders = Order.where("order_status LIKE ?", "%#{params[:status]}%")
		@orders.update(order_params)
		redirect_to admins_orders_path
    end

    private

    def order_params
        params.require(:order).permit(:order_status)
    end
end
