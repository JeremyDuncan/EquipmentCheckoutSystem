class ManagementStaffsController < ApplicationController
  def index
    @management_staffs = ManagementStaff.all
  end

  # Custom method to review equipment inventory
  def review_equipment_inventory
    @management_staff = ManagementStaff.find(params[:id])
    @management_staff.review_equipment_inventory
  end

  # Custom method to generate equipment usage report
  def generate_equipment_usage_report
    @management_staff = ManagementStaff.find(params[:id])
    @management_staff.generate_equipment_usage_report
  end

end
