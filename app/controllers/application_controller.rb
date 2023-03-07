class ApplicationController < ActionController::Base
  include Pundit::Authorization

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  # Pundit: allow-list approach
  after_action :verify_authorized, except: [:index, :my_posts], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: [:index, :my_posts], unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(root_path)
  end

  def not_found
    flash[:alert] = 'Not found'
    redirect_to(root_path)
  end

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
