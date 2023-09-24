class HomeController < ApplicationController
  before_action :authenticate_hr_staff!, only: [:hr_dashboard]
  before_action :authenticate_management_staff!, only: [:management_dashboard]
  # ... rest of your code

  def index
    unless maintenance_staff_signed_in?
      redirect_to new_maintenance_staff_session_path
    end
  end
end