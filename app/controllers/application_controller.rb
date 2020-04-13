class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, :authenticate_user!, if: :devise_controller?
  protected

  def after_sign_in_path_for(resource)
    user_path(@user.id)
  end

  def configure_permitted_parameters
  	added_attrs = [:name, :email, :password, :password_confirmation, :remember]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end
end
