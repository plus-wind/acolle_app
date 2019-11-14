class OrdersController < ApplicationController
  def order
    @user = User.find(1)
  end

  def confirmation
  end

  def complete
  end

end
