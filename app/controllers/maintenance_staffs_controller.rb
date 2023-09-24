class MaintenanceStaffsController < ApplicationController
  def index
    @maintenance_staffs = MaintenanceStaff.all
  end

  # Show a single maintenance staff
  def show
    @maintenance_staff = MaintenanceStaff.find(params[:id])
  end

  # Custom method to check out equipment
  def check_out_equipment
    @maintenance_staff = MaintenanceStaff.find(params[:id])
    @maintenance_staff.check_out_equipment
  end

  # Custom method to check in equipment
  def check_in_equipment
    @maintenance_staff = MaintenanceStaff.find(params[:id])
    @maintenance_staff.check_in_equipment
  end
end
