class Api::V1::BaseController < ActionController::API
  include Pundit

  after_action :verify_authorized, except: [:index, :my_posts]
  after_action :verify_policy_scoped, only: [:index, :my_posts]

  rescue_from Pundit::NotAuthorizedError,   with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def user_not_authorized(exception)
    render json: {
      error: "Unauthorized #{exception.policy.class.to_s.underscore.camelize}.#{exception.query}"
    }, status: :unauthorized
  end

  def not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end
end