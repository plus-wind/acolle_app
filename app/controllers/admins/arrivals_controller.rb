class Admins::ArrivalsController < ApplicationController

  def search

  end

  def index
    @arrivals = Arrival.all
  end

  def destroy
  end

  def edit
  end

  def update
  end

end
