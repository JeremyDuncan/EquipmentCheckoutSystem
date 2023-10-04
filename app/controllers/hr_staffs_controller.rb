class HrStaffsController < ApplicationController

  def index
    @hr_staffs          = HrStaff.all
    @maintenance_staffs = MaintenanceStaff.all
    @management_staffs  = ManagementStaff.all
    @all_staffs = {
      hr_staffs:          @hr_staffs,
      maintenance_staffs: @maintenance_staffs,
      management_staffs:  @management_staffs
    }
  end
  
  # =======================================================
  # Initialize a new Employee object for the form
  # -------------------------------------------------------
  def new
    @employee = params[:type].constantize.new if params[:type].in?(['HrStaff', 'MaintenanceStaff', 'ManagementStaff'])
    @employee ||= HrStaff.new
  end
  
  def create
    create_employee
  end
  
  # ============================================================================
  # Creates a new employee using the EmployeeFactory, assigns default login
  # credentials for the first time, and redirects or renders errors accordingly
  # ============================================================================
  def create_employee
    employee_type       = params[:hr_staff][:type]
    employee_attributes = params.require(:hr_staff).permit(:first_name, :last_name, :type)
    employee_attributes = employee_attributes.except(:type) # Remove :type
  
    begin
      # Create employee using EmployeeFactory
      new_employee = EmployeeFactory.create_employee(employee_type, employee_attributes)
      
      if new_employee.persisted?
        # Assign default login credentials
        default_password      = '12345678'
        new_employee.email    = "#{new_employee.first_name.downcase}.#{new_employee.last_name.downcase}@devry.edu"
        new_employee.password = default_password
  
        if new_employee.save
          redirect_to hr_staffs_path, notice: 'Employee was successfully created.'
        else
          flash.now[:alert] = new_employee.errors.full_messages.join(", ")
          render :new
        end
      else
        flash.now[:alert] = new_employee.errors.full_messages.join(", ")
        render :new
      end
    rescue => e
      flash.now[:alert] = e.message
      render :new
    end
  end
  
  def edit
     @hr_staff = HrStaff.find(params[:id])
  end
  
  def update
    @hr_staff = HrStaff.find(params[:id])
    if @hr_staff.update(hr_staff_params)
      redirect_to hr_staffs_path, notice: 'HR Employee was successfully updated.'
    else
      flash.now[:alert] = @hr_staff.errors.full_messages.join(", ")
        respond_to do |format|
          format.turbo_stream { render turbo_stream: turbo_stream.replace('alert', 
                                                                          partial: 'turbo_layouts/alert', 
                                                                          locals: { alert: flash.now[:alert] }) }
          format.html { render :edit }
      end
    end
  end
  
  def show
    @hr_staff = HrStaff.find(params[:id])
  end
  
  def destroy
    @hr_staff = HrStaff.find(params[:id])
    @hr_staff.destroy
    redirect_to hr_staffs_path, notice: 'HR Employee was successfully removed.'
  end
  
  private
  def hr_staff_params
    params.require(:hr_staff).permit(:first_name, :last_name, :role)
  end
  
  
  
  
  
  
  
  
  ##################################################################################
  ## DEVISE METHODS
  ################################################################################## 
  # # ==============================================================================
  # # This before_action ensures that only HR Staff can access specific actions
  # # ------------------------------------------------------------------------------
  # before_action :ensure_hr!, only: [:some_hr_action]
  #
  # private
  #
  # # ==============================================================================
  # # This method ensures the current user is HR Staff
  # # ------------------------------------------------------------------------------
  # def ensure_hr!
  #   unless current_staff.is_a? HrStaff
  #     redirect_to root_path, alert: 'Not authorized'
  #   end
  # end
  #
  
  
  
  
  
  
  
  
  
  
end
