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
  # Initialize a new HR Staff object for the form
  # -------------------------------------------------------
  def new
    @hr_staff = HrStaff.new
  end
  def create
    create_employee
  end
  def create_employee
    employee_type       = params[:hr_staff].delete(:employee_type).to_sym
    employee_attributes = params.require(:hr_staff).permit(:first_name, :last_name)
    begin
      new_employee = EmployeeFactory.create_employee(employee_type, employee_attributes)
      if new_employee.persisted?
        redirect_to hr_staffs_path, notice: 'Employee was successfully created.'
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
end
