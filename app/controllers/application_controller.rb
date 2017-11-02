class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[email password password_confirmation first_name last_name birth_date])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[email password password_confirmation irst_name last_name birth_date])
  end
end
