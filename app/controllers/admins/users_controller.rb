class Admins::UsersController < ApplicationController
    layout "admins"
    before_action :authenticate_admin!
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
		flash[:notice] = "ユーザ情報の更新が完了しました。"
		redirect_to admins_users_path
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if  @user.update(user_params)
			flash[:notice] = "ユーザ情報の更新が完了しました。"
			redirect_to admins_user_path(@user)
	    else
	    	flash[:notice] = "error"
	    	render :edit
	    end
	end

	private
    def user_params
        params.require(:user).permit(:name_family_kanji, :name_first_kanji, :name_family_furigana, :name_first_furigana, :postal_code, :address_prefecture, :address_city, :address_number, :address_building, :phone_number, :delete_flag)
    end
end
