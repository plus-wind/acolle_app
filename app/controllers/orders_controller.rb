class OrdersController < ApplicationController
  def order
    @users = User.all
  end

  def confirmation
  end

  def complete
  end

end
