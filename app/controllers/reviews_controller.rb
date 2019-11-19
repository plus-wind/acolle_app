class ReviewsController < ApplicationController
	def new
		@review = Review.new
		@item = Item.find(1)    # 仮で1置いてます
		@order_item = OrderItem.find(@item.id)
		@satisfaction_average = @item.reviews.average(:satisfaction)
		@satisfaction_count = @item.reviews.length
	end
    def create
    	@review = Review.new(review_params)
    	@review.user_id = current_user.id
    	@item = Item.find(1)    # 仮で1置いてます
    	@review.item_id = @item.id
    	@review.save
    	redirect_to item_path(@item.id)
    end
    def edit
    	@order_item = OrderItem.find(1) # 仮で1置いてます
    	@item = @order_item.item
    	@review = Review.find(1) # 仮で1置いてます
    	@satisfaction_average = @item.reviews.average(:satisfaction)
		@satisfaction_count = @item.reviews.length

    	if @review.user != current_user
    		redirect_to mypage_path
    	else
           render :edit
        end
    end
    def update
    	review = Review.find(params[:id])
    	review.update(review_params)
    	redirect_to mypage_path
    end
    private
    def review_params
      params.require(:review).permit(:user_id, :item_id, :review_title, :review_content, :satisfaction)
    end
end
