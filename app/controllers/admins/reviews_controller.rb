class Admins::ReviewsController < ApplicationController
	def index
		@reviews = Review.page(params[:page]).per(2).reverse_order
	end
	def search
		if params[:search_flag] == "1"
			@users = User.where("name_family_kanji || name_first_kanji LIKE ?", "%#{params[:search_word]}%")
			@reviews = []
			@users.each do |u|
				u.reviews.each do |i|
					@reviews << i
				end
			end
			@reviews = Kaminari.paginate_array(@reviews).page(params[:page]).per(2)
		elsif params[:search_flag] == "2"
			@users = User.where("name_family_furigana || name_first_furigana LIKE ?", "%#{params[:search_word]}%")
			@reviews = []
			@users.each do |u|
				u.reviews.each do |r|
					@reviews << r
				end
			end
			@reviews = Kaminari.paginate_array(@reviews).page(params[:page]).per(2)
		elsif params[:search_flag] == "3"
			@items = Item.where("item_name LIKE ?", "%#{params[:search_word]}%")
			@reviews = []
			@items.each do |i|
				i.reviews.each do |r|
					@reviews << r
				end
			end
			@reviews = Kaminari.paginate_array(@reviews).page(params[:page]).per(2)
		else params[:search_flag] == "4"
			@reviews = Review.where("datetime(created_at) LIKE ?", "%#{params[:search_word]}%")
			@reviews = Kaminari.paginate_array(@reviews).page(params[:page]).per(2)
		end
		render :index
	end
	def show
		@review = Review.find(params[:id])
	end
	def edit
		@review = Review.find(params[:id])
	end
	def destroy
		review = Review.find(params[:id])
		review.destroy
		redirect_to admins_reviews_path
	end
	def update
      	review = Review.find(params[:id])
    	review.update(review_params)
    	redirect_to admins_review_path
	end
	def sort
		if params[:sort_type] == "1" && params[:sort_flag] == "1"
			@reviews = Review.all.order('created_at ASC').page(params[:page]).per(2)
			render :index
		elsif params[:sort_type] == "1" && params[:sort_flag] == "2"
			@reviews = Review.all.order('created_at DESC').page(params[:page]).per(2)
			render :index
		elsif params[:sort_type] == "2" && params[:sort_flag] == "1"
			@reviews = Review.all.order('satisfaction ASC').page(params[:page]).per(2)
			render :index
		elsif params[:sort_type] == "2" && params[:sort_flag] == "2"
			@reviews = Review.all.order('satisfaction DESC').page(params[:page]).per(2)
			render :index
		end
	end
	private
    def review_params
      params.require(:review).permit(:user_id, :item_id, :review_title, :review_content, :satisfaction)
    end
end
