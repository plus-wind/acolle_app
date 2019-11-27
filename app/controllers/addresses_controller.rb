class AddressesController < ApplicationController

  def change
    @delivery = current_user.addresses
  end

  def edit
  	@address = Address.find(params[:id])
  end

  def update
  	@address = Address.find(params[:id])
	if  @address.update(address_params)
		flash[:notice] = "お届け先情報の更新が完了しました。"
		redirect_to mypage_path(current_user)
    else
    	flash[:notice] = "error"
    	render :edit
    end
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.user_id = current_user.id
    @address.save
    redirect_to mypage_path
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to mypage_path
  end

  private
     def address_params
        params.require(:address).permit(:delivery_name_family_kanji, :delivery_name_first_kanji, :delivery_name_family_furigana, :delivery_name_first_furigana, :delivery_postal_code, :delivery_address_prefecture, :delivery_address_city, :delivery_address_number, :delivery_address_building)
    end

end
