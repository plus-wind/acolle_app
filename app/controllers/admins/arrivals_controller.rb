class Admins::ArrivalsController < ApplicationController
    layout "admins"
  def index
    @arrivals = Arrival.all.order("id DESC").page(params[:page]).per(5)
  end

  def search
    if params[:search_flag] == "1"
      @arrivals = Arrival.where("date(arrival_date) LIKE ?", "%#{params[:search_word]}%")
      @arrivals = Kaminari.paginate_array(@arrivals).page(params[:page]).per(5)
    elsif params[:search_flag] == "2"
      @items = Item.where("item_name LIKE ?", "%#{params[:search_word]}%")
      @arrivals = []
      @items.each do |i|
        i.arrivals.each do |a|
          @arrivals << a
        end
      end
      @arrivals = Kaminari.paginate_array(@arrivals).page(params[:page]).per(5)
    else params[:search_flag] == "3"
      @arrivals = Arrival.where("integer(id) LIKE ?", "%#{params[:search_word]}")
      @arrivals = Kaminari.paginate_array(@arrivals).page(params[:page]).per(5)
    end
    render :index
  end

  def sort
    if params[:sort_type] == "1"
      @arrivals = Arrival.all.order('id DESC').page(params[:page]).per(5)
      render :index
    elsif params[:sort_type] == "2"
      @arrivals = Arrival.all.order('arrival_date DESC').page(params[:page]).per(5)
      render :index
    end
  end

  def destroy
    arrival = Arrival.find(params[:id])
    arrival.destroy
    redirect_to admins_arrivals_path
  end

  def edit
    @arrival = Arrival.find(params[:id])
  end

  def update
    arrival =Arrival.find(params[:id])
    arrival.update(arrival_params)
    redirect_to admins_arrivals_path
  end

  def create

  end

  private
	def arrival_params
    params.require(:arrival).permit(:item_id, :arrival_number, :arrival_date)
	end
end
