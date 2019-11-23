class Admins::ItemsController < ApplicationController
	layout "admins"
	def index
	end
	def edit
		@item = Item.find(params[:id])
    	@disc = @item.discs.build
    	@song = @disc.songs.build
	end

private
	def item_params
		params.require(:item).permit(:item_name, :description, discs_attributes: [:id, :description, :done, :_destroy, songs_attributes: [:id, :description, :_destroy]])
    end
end
