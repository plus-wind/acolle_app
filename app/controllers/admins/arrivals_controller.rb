class Admins::ArrivalsController < ApplicationController
    layout "admins"
  def search

  end

  def index
    @arrivals = Arrival.all
  end

  def destroy
  end

  def edit
    @arrival = Arrival.find(params[:id])
  end

  def update
    arrival =Arrival.find(params[:id])
    arrival.update(arrival_params)
    redirect_to admins_arrivals_path
  end

  private
	def arrival_params
		 params.require(:arrival).permit(:item_id, :arrival_number, :arrival_date)
	end
end
