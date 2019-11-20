class OrdersController < ApplicationController
  def order
    if params[:delivery_flag].nil?                #delivery_flagが空の時
      p current_user
      @full_name = current_user.name_family_kanji + "　" + current_user.name_first_kanji
      @user_address = "〒" + current_user.postal_code.insert(3, "-") + "　" + current_user.address_prefecture + current_user.address_city +                                      current_user.address_number + current_user.address_building
      @delivery = current_user.addresses
      @delivery_flag = 0                          #分岐に対するフラグ
      # binding.pry
      @carts = current_user.carts
      @order = Order.new(postage:500)
    else                                          #delivery_flagに値が入っている時
      p current_user
      @full_name = current_user.name_family_kanji + "　" + current_user.name_first_kanji
      @user_address = "〒" + current_user.postal_code.insert(3, "-") + "　" + current_user.address_prefecture + current_user.address_city +                                      current_user.address_number + current_user.address_building
      delivery_num = params[:delivery_flag].to_i #送付先idを数値変換
      @delivery = Address.find(delivery_num)     #送付先取得
      @delivery_flag = 1
      # binding.pry                         #分岐に対するフラグ
      @carts = current_user.carts
      @order = Order.new(postage:500)
    end
  end

  def confirmation
    @carts = current_user.carts
    @order = Order.new(postage:500)
    @delivery = current_user.addresses
    if params[:pay_flag] == "1"
      @shiharai = "クレジットカード"
    elsif params[:pay_flag] == "2"
      @shiharai = "振込"
    else params[:pay_flag] == "3"
      @shiharai = "代引き"
    end

  end

  def complete

  end

end
