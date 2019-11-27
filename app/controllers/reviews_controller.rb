class ReviewsController < ApplicationController
	def new
		@review = Review.new
		@item = Item.find(params[:item_id])
		@order_item = OrderItem.find_by(item_id: @item.id)
		@satisfaction_average = @item.reviews.average(:satisfaction)
		@satisfaction_count = @item.reviews.length
	end
    def create
    	@review = Review.new(review_params)
    	@review.user_id = current_user.id
    	@item = Item.find(params[:item_id])
    	@review.item_id = @item.id
    	@review.save
    	redirect_to item_path(@item.id)
    end
    def edit
        @review = Review.find(params[:id])
    	@order_item = OrderItem.where(item_id: @review.item_id).order(created_at: :desc).first
    	@item = @order_item.item
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
        @item = Item.find_by(id: review.item_id)
    	redirect_to item_path(@item.id)
    end
    def destroy
        review = Review.find(params[:id])
        review.destroy
        redirect_to mypage_path
    end
    private
    def review_params
      params.require(:review).permit(:user_id, :item_id, :review_title, :review_content, :satisfaction)
    end
end

