class CartsController < ApplicationController
    before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]

  def index
    p current_user
    # @cart = Cart.find(params[:id])
    @carts = Cart.where(user_id:current_user.id)
  end

  # 商品一覧画面から、「商品購入」を押した時のアクション
  def add
    # @cart = Cart.find(params[:id])
    if @cart.blank?
      @cart = Cart.new(cart_params)
      @cart.user_id = current_user.id
    end
    @cart.cart_item_number += params[:cart_item_number].to_i
    @cart.save
    pp @cart
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
end
