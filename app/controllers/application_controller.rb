class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  def after_sign_out_path(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :name,
      :email,
      :profile_image_id,
      :introduction,
      :postcode,
      :prefecture_code,
      :prefecture_name,
      :address_city,
      :address_street,
      :address_building])

    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    # ログイン時nameでできるようにする時に追加
  end
end
