class MaintenanceStaffsController < ApplicationController


  def index
    @maintenance_staffs = MaintenanceStaff.all
  end

end
