class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:password,:role])
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

   def after_sign_in_path_for(resource)
    byebug
    if resource.role == "client"
      clients_url
    else 
      jobs_path
    end
  end

  def after_sign_up_path_for(resource)
    byebug
    if resource.role == "client"
      clients_url
    else 
      jobs_path
    end
  end

end