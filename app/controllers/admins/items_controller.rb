class Admins::ItemsController < ApplicationController
	layout "admins"
	def index
	end
	def edit
		@item = Item.find(params[:id])
	end
end
