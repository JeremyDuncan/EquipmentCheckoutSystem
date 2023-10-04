module HrStaffs
  class RegistrationsController < Devise::RegistrationsController
    before_action      :configure_permitted_parameters, if: :devise_controller?
    skip_before_action :authenticate_user, only: [:new, :create]
    protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :password_confirmation])
    end
  end
end
