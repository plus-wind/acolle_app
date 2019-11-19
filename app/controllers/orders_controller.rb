class OrdersController < ApplicationController
  def order
    p current_user
    @full_name = current_user.name_family_kanji + "　" + current_user.name_first_kanji
    @user_address = "〒" + current_user.postal_code.insert(3, "-") + "　" + current_user.address_prefecture + current_user.address_city +                                      current_user.address_number + current_user.address_building
    @delivery = current_user.addresses
    @carts = current_user.carts
    @order = Order.new(postage:500)
  end

  def confirmation
    @address = current_user.addresses
    if params[:pay_flag] == "1"
      @shiharai = "クレジットカード"
    elsif params[:pay_flag] == "2"
      @shiharai = "振込"
    else params[:pay_flag] == "3"
      @shiharai = "代引き"
    end
    render :confirmation
  end

  def complete
  end

end
