require 'console_colors'
class ApplicationController < ActionController::Base
  # =====================================================================
  # This before action will redirect to the appropriate login page if the 
  # user is not authenticated.
  # ---------------------------------------------------------------------
  before_action :authenticate_user, unless: :devise_controller?
  include Devise::Controllers::Helpers
  include ConsoleColors
  
  # ==============================================================================
  # This method will set a helper method current_staff that returns the
  # currently signed-in staff, regardless of their type.
  # ------------------------------------------------------------------------------
  def current_staff
    current_hr_staff || current_management_staff || current_maintenance_staff
  end
  helper_method :current_staff
  
  
  private
  def authenticate_user
    if current_staff.nil?
      redirect_to new_user_session_path, alert: "Please login to continue."
    end
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :password_confirmation])
  end
end
