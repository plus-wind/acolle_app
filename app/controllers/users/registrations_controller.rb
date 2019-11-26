class Users::RegistrationsController < Devise::RegistrationsController
  #protect_from_forgery with: :exception
  # before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  #   @address = Address.new(address_params)
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  def destroy
    resource.delete_flag = 1
    resource.save
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    redirect_to users_unsubscribe_complete_path
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end


  def unsubscribe
  end

  def complete
  end

  def after_update_path_for(resource)
    @user = current_user
    @address = Address.where(user_id: @user.id).first

    @address.update(
      user_id: current_user.id,
      delivery_name_family_kanji: @user.name_family_kanji,
      delivery_name_first_kanji: @user.name_first_kanji,
      delivery_name_family_furigana: @user.name_family_furigana,
      delivery_name_first_furigana: @user.name_first_furigana,
      delivery_postal_code: @user.postal_code,
      delivery_address_prefecture: @user.address_prefecture,
      delivery_address_city: @user.address_city,
      delivery_address_number: @user.address_number,
      delivery_address_building: @user.address_building
      )
    mypage_path
  end

  def after_sign_up_path_for(resource)
      @user = current_user
      Address.create(   #create = newとsaveを同時に行う
      user_id: @user.id,
      delivery_name_family_kanji: @user.name_family_kanji,
      delivery_name_first_kanji: @user.name_first_kanji,
      delivery_name_family_furigana: @user.name_family_furigana,
      delivery_name_first_furigana: @user.name_first_furigana,
      delivery_postal_code: @user.postal_code,
      delivery_address_prefecture: @user.address_prefecture,
      delivery_address_city: @user.address_city,
      delivery_address_number: @user.address_number,
      delivery_address_building: @user.address_building
      )
    root_path
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name_family_kanji, :name_first_kanji, :name_family_furigana, :name_first_furigana, :postal_code, :address_prefecture, :address_city, :address_number, :address_building, :phone_number, :delete_flag])
    # params.require(:address).permit(:delivery_name_family_kanji, :delivery_name_first_kanji, :delivery_name_family_furigana, :delivery_name_first_furigana, :delivery_postal_code, :delivery_address_prefecture, :delivery_address_city, :delivery_address_number, :delivery_address_building)
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name_family_kanji, :name_first_kanji, :name_family_furigana, :name_first_furigana, :postal_code, :address_prefecture, :address_city, :address_number, :address_building, :phone_number, :delete_flag])
  end
  #↓Devise情報編集P、パスワード確認が不要になる
  # def update_resource(resource, params)
  #   resource.update_without_current_password(params)
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  # protected
  #   def configure_permitted_parameters
  #     devise_parameter_sanitizer.permit(:sign_up, keys: [:name_family_kanji, :name_first_kanji, :name_family_furigana, :name_first_furigana, :postal_code, :address_prefecture, :address_city, :address_number, :address_building, :phone_number, :delete_flag])
  #     devise_parameter_sanitizer.permit(:sign_in, keys: [:name_family_kanji, :name_first_kanji, :name_family_furigana, :name_first_furigana, :postal_code, :address_prefecture, :address_city, :address_number, :address_building, :phone_number, :delete_flag])
  #     devise_parameter_sanitizer.permit(:account_update, keys: [:name_family_kanji, :name_first_kanji, :name_family_furigana, :name_first_furigana, :postal_code, :address_prefecture, :address_city, :address_number, :address_building, :phone_number, :delete_flag])
  #   end
  # end
end
