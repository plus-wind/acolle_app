class CartsController < ApplicationController
    # before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]

  def index
    p current_user
    # @cart = Cart.find(params[:id])
    @carts = Cart.where(user_id:current_user.id)
    # @carts = current_user.carts
  end

  # 商品一覧画面から、「商品購入」を押した時のアクション
  def add
    unless current_user.nil?
    @cart = Cart.find_by(user_id: current_user.id, item_id: params[:cart][:item_id])
    if @cart.blank?
      @cart = Cart.new(cart_params)
      @cart.user_id = current_user.id
    else
      @cart.cart_item_number += params[:cart][:cart_item_number].to_i
    end
    @cart.save
    pp @cart
    redirect_to cart_path
    else
    redirect_to new_user_session_path
    end
  end

  def update
    @cart = Cart.find(params[:id])
    @cart.update(cart_update_params)
    redirect_to cart_path
  end

 # カート詳細画面から、「削除」を押した時のアクション
  def remove
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to cart_path
  end

  def destroy
    @carts = Cart.where(user_id:current_user.id)
    @carts.destroy_all
    flash[:notice] = "カートが空になりました"
    redirect_to cart_path
  end

  # def setup_cart_item!
  #   @cart = current_user.carts.find_by(item_id: params[:item_id])
  # end
	private
  def cart_params
    params.require(:cart).permit(:user_id, :item_id, :cart_item_number)
  end
  def cart_update_params
    params.require(:cart).permit(:id, :cart_item_number)
  end
end
