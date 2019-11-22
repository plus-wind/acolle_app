class Admins::UsersController < ApplicationController
    layout "admins"

	def index
	  @users = User.all
	end

	def search
		if params[:search_flag] == "1"
	  		@users = User.where("id LIKE ?", "#{params[:search_word]}")
		elsif params[:search_flag] == "2"
			@users = User.where("name_family_kanji || name_first_kanji LIKE ?", "%#{params[:search_word]}%")
		else params[:search_flag] == "3"
			@users = User.where("name_family_furigana || name_first_furigana LIKE ?", "%#{params[:search_word]}%")
		end
		render :index
	end

	def show
		@user = User.find(params[:id])
	end

	def withdraw
		user = User.find(params[:id])
		user.update(delete_flag: 1)
		redirect_to admins_users_path
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
	end
end
