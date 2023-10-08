class HrStaffsController < ApplicationController

  # ==============================================================================
  # This method handles the index action for the HrStaffsController.
  # It sets up pagination, applies filters based on the role,
  # and calculates the total number of pages and records.
  # ------------------------------------------------------------------------------
  def index
    # Filtering
    @initial_letter = params[:initial_letter] || 'A'
    @role           = params[:role] || 'HrStaff'
    @date_range     = params[:date_range]

    maintenance_query = {}
    management_query  = {}
    hr_query          = {}

    # Pagination
    @page = params[:page].to_i
    @page = 1 if @page.zero?
    @number_of_entries_to_show = 10
    if @role.present?
      @per_page = @number_of_entries_to_show
    else
      @per_page = (@number_of_entries_to_show / 3.0).ceil
    end

    offset = (@page - 1) * @per_page

    if @role.present?
      case @role
      when "MaintenanceStaff"
        maintenance_query = MaintenanceStaff.all
        maintenance_query = maintenance_query.where("last_name LIKE ?", "#{@initial_letter}%")  if @initial_letter.present?
        maintenance_page  = maintenance_query.offset(offset).limit(@per_page).order(created_at: :desc)
      when "ManagementStaff"
        management_query  = ManagementStaff.all
        management_query  = management_query.where("last_name LIKE ?", "#{@initial_letter}%")   if @initial_letter.present?
        management_page   = management_query.offset(offset).limit(@per_page).order(created_at: :desc)
      when "HrStaff"
        hr_query = HrStaff.all
        hr_query = hr_query.where("last_name LIKE ?", "#{@initial_letter}%") if @initial_letter.present?
        hr_page = hr_query.offset(offset).limit(@per_page).order(created_at: :desc)
      end
    else
      # Base queries
      hr_query          = HrStaff.all
      maintenance_query = MaintenanceStaff.all
      management_query  = ManagementStaff.all

      maintenance_query = maintenance_query.where("last_name LIKE ?", "#{@initial_letter}%")  if @initial_letter.present?
      management_query  = management_query.where("last_name LIKE ?",  "#{@initial_letter}%")  if @initial_letter.present?
      hr_query          = hr_query.where("last_name LIKE ?",          "#{@initial_letter}%")  if @initial_letter.present?

      maintenance_page  = maintenance_query.offset(offset).limit(@per_page)
      management_page   = management_query.offset(offset).limit(@per_page)
      hr_page           = hr_query.offset(offset).limit(@per_page)
    end

    # Initialize @all_staffs
    @all_staffs = {
      hr_staffs:          hr_page,
      maintenance_staffs: maintenance_page,
      management_staffs:  management_page
    }

    # Set the total number of records based on your current filters
    @total_records       = hr_query.count + maintenance_query.count + management_query.count
    @grand_total_records = HrStaff.all.count + MaintenanceStaff.all.count + ManagementStaff.all.count

    # Calculate total pages for pagination
    @total_pages = (@total_records.to_f / @per_page).ceil
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
    current_letter = params[:current_letter]
    redirect_to hr_staffs_path(initial_letter: current_letter)
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
