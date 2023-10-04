# For HR Staffs
module MaintenanceStaffs
  class SessionsController < Devise::SessionsController
    
    def create
      resource = warden.authenticate!(auth_options)
      if resource
        set_flash_message!(:notice, :signed_in)
        sign_in(resource_name, resource)
        yield resource if block_given?
        respond_with resource, location: after_sign_in_path_for(resource)
      else
        # Handle login failure here
        redirect_to new_user_session_path, alert: "Login failed!"
      end
    end
    
  end
end
