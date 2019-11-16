class ApplicationController < ActionController::Base


	private
  def after_sign_in_path_for(resource)
    if resource_or_scope == :admins
      admins_items_path
    else
      root_path
    end
   end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :users
      root_path
    elsif resource_or_scope == :admins
      new_admin_session_path
    else
      root_path
    end
   end

end
