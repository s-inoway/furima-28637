class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:nickname, :email, :password, :password_confirmation, :first_name, :last_name, :first_name_furigana, :last_name_furigana, :birthday]
    )
    devise_parameter_sanitizer.permit(
      :sign_in, keys: [:email, :password]
    )
  end

  def redirect_to_signed_in
    redirect_to new_user_session_path unless user_signed_in?
  end
end
