class ApplicationController < ActionController::Base
  before_action :check_header
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index; end

  private

  def check_header
    @check = (params[:controller] == 'users/sessions' && params[:action] == 'new') ||
    request.path == user_registration_path|| (params[:controller] == 'devise/registrations' && params[:action] == 'new')
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email name username password])
    # devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :address, :phone, :birthday])
  end
end
