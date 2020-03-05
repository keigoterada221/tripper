class ApplicationController < ActionController::Base
# サインアップ時にパラメーターで受け取れるデータの種類を増やす
before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
      root_path
  end

  def after_sign_up_path_for(resource)
      root_path
  end
  def after_inactive_sign_up_path_for(resource)
      root_path
  end

  def after_sign_out_path_for(resource)
      root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name,:phone_number,:email,:post_code,:prefecture_code,:address_city,:address_street])
  end
end
