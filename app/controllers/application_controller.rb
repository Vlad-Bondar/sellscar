class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  private 
  def set_locale    
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge(options)
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up , keys: [:user_name, :email, :password])
    devise_parameter_sanitizer.permit(:account_update , keys: [:user_name, :email, :password, :current_password])
  end

end
