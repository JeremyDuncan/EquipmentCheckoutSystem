class HrStaffsController < ApplicationController

  def index
    @hr_staffs = HrStaff.all
  end
  
  def update_employee_records
    @hr_staff = HRStaff.find(params[:id])
    @hr_staff.update_employee_records
  end
end
