class ReviewsController < ApplicationController
	def new
		@review = Review.new
		@item = Item.find(1)    # 仮で1置いてます
		@order_item = OrderItem.find(@item.id)
		@satisfaction_average = @item.reviews.average(:satisfaction)
		@satisfaction_count = @item.reviews.length
	end
end
