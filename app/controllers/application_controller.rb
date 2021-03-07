class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resouce)
    user_path(current_user.id)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :profile_image_id, :introduction])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    # ログイン時nameでできるようにする時に追加
  end
end
