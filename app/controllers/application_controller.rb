class ApplicationController < ActionController::Base
  include Pagy::Backend

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, alert: exception.message
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:email, :password, :password_confirmation,
        :remember_me, :avatar, :avatar_cache, :remove_avatar]

    devise_parameter_sanitizer.permit :account_update, keys: [:email, :password, :password_confirmation,
        :current_password, :avatar, :avatar_cache, :remove_avatar]
  end
end
