class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:username, :name, :lastname, :website, :description, :image, :image_cache])
    devise_parameter_sanitizer.permit(:user_update, keys:[:username, :name, :lastname, :website, :description, :image, :image_cache])
  end

end
