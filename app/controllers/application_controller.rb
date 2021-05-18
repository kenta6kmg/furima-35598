class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
def configure_permitted_parameters
  # deviseのUserモデルにパラメーターを許可
  devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :ruby_last, :ruby_first, :birth, :password])
end
end
