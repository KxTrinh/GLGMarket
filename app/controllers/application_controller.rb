class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :last_name, :address, :age, :email, :password, :avatar)}

  #   devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :last_name, :address, :age, :email, :password, :password_confirmation, :current_password, :avatar)}
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :address, :age, :email, :password, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :last_name, :address, :age, :email, :password, :password_confirmation, :current_password, :avatar])
  end
end
