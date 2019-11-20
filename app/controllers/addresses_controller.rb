class AddressesController < ApplicationController

  def change
    @delivery = current_user.addresses
  end
  
end
