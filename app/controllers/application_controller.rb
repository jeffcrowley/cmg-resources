class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #from devise wiki. Needed for strong parameters.
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :title, :region])
  end

  def admin_only
   unless current_user.admin?
      redirect_to root_path, alert: "Access Denied."
   end
  end
end
