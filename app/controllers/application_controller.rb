class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:login_page]
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to root_path, alert: 'Access denied.'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
