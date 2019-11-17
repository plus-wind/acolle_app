class OrdersController < ApplicationController
  def order
    p current_user
    @full_name = current_user.name_family_kanji + "　" + current_user.name_first_kanji
    @user_address = "〒" + current_user.postal_code.insert(3, "-") + "　" + current_user.address_prefecture + current_user.address_city +                                      current_user.address_number + current_user.address_building
    @carts = Cart.where(user_id:current_user.id)
  end

  def confirmation
  end

  def complete
  end

end
