class EmployeeRecordsController < ApplicationController
  def index
    @employee_records = EmployeeRecord.all
  end
  
  # =======================
  # Updates employee status
  # -----------------------
  def update_employee_status
    @employee_record = EmployeeRecord.find(params[:id])
    @employee_record.update_employee_status
  end
end
