class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource_or_scope)
    welcome_index_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  protected

  # my custom fields are :display_name
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:display_name,
               :email, :password, :password_confirmation, :avatar)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:display_name,
               :email, :password, :password_confirmation, :current_password, :avatar)
    end
  end


end
