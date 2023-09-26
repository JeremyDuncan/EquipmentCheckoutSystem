# ==============================================================================
# The EmployeeRecordsController class is responsible for handling actions
# related to Employee Records in the Equipment Checkout System (ECS).
# ------------------------------------------------------------------------------

class EmployeeRecordsController < ApplicationController
  # ======================================================================
  # The index action fetches all employee records and makes them available
  # for the view.
  # ----------------------------------------------------------------------
  def index
    @employee_records = EmployeeRecord.all
  end
  
  # ======================================================================
  # The create action is responsible for creating a new employee record.
  # It uses the EmployeeFactory to create an employee of a specific type
  # (:hr, :maintenance, :management) with the given attributes.
  # If the employee is successfully created and saved, it redirects to the
  # employee records index page with a success notice.
  # Otherwise, it renders the 'new' view to allow for corrections.
  # Params:
  # :employee_type => Symbol representing the type of employee to create
  #  attributes    => Hash containing the attributes for the new employee
  # ----------------------------------------------------------------------
  def create
    employee_type = params[:employee_type].to_sym # :hr, :maintenance, :management
    attributes    = params[:employee]             # The attributes for the employee
    employee      = EmployeeFactory.create_employee(employee_type, attributes)
    
    if employee.persisted?
      redirect_to employee_records_path, notice: 'Employee was successfully created.'
    else
      render :new
    end
  end
  
  # =======================
  # Updates employee status
  # -----------------------
  def update_employee_status
    @employee_record = EmployeeRecord.find(params[:id])
    @employee_record.update_employee_status
  end
end
