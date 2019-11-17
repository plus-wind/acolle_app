class CartsController < ApplicationController
    before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]

  def index
    p current_user
    @carts = Cart.where(user_id:current_user.id)
  end

  # 商品一覧画面から、「商品購入」を押した時のアクション
  # def add
  #   if @cart.blank?
  #     @cart = current_user.carts.build(item_id: params[:item_id])
  #   end

  #   @cart.quantity += params[:quantity].to_i
  #   @cart.save
  #   redirect_to root_path
  # end

 # カート詳細画面から、「削除」を押した時のアクション
  def remove
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to current_user.carts
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy_all
    redirect_to root_path
  end

  private

  def setup_cart_item!
    @cart = current_user.carts.find_by(item_id: params[:item_id])
  end
end
