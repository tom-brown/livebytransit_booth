class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:paid, :admin, :first_name, :last_name, :comments])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:paid, :admin, :first_name, :last_name, :comments])
  end
end
