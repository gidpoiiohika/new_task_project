class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_user, if: :user_signed_in?

  protected

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to new_user_session_url
    end
  end

  def configure_permitted_parameters
    attributes = [:first_name, :last_name, :password, :password_confirmation, :email]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end

  private

  def set_current_user
    Current.user = current_user
  end
end
