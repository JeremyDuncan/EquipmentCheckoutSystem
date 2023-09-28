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
  
  # =======================================================
  # Initialize a new Maintenance Staff object for the form
  # -------------------------------------------------------
  def new
    @maintenance_staff = MaintenanceStaff.new
  end
  def create
    @maintenance_staff = MaintenanceStaff.new(maintenance_staff_params)
    if @maintenance_staff.save
      redirect_to maintenance_staffs_path, notice: 'Maintenance Employee was successfully added.'
    else
      flash.now[:alert] = @maintenance_staff.errors.full_messages.join(", ")
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('alert', 
                                                                        partial: 'turbo_layouts/alert', 
                                                                        locals: { alert: flash.now[:alert] }) }
        format.html { render :new }
      end
    end
  end
  
  def edit
    @maintenance_staff = MaintenanceStaff.find(params[:id])
  end
  
  def update
    @maintenance_staff = MaintenanceStaff.find(params[:id])
    if @maintenance_staff.update(maintenance_staff_params)
      redirect_to maintenance_staffs_path, notice: 'Maintenance Employee was successfully updated.'
    else
      flash.now[:alert] = @maintenance_staff.errors.full_messages.join(", ")
        respond_to do |format|
          format.turbo_stream { render turbo_stream: turbo_stream.replace('alert', 
                                                                          partial: 'turbo_layouts/alert', 
                                                                          locals: { alert: flash.now[:alert] }) }
          format.html { render :edit }
      end
    end
  end
  
  def destroy
    @maintenance_staff = MaintenanceStaff.find(params[:id])
    puts @maintenance_staff.inspect
    @maintenance_staff.destroy
    redirect_to maintenance_staffs_path, notice: 'Maintenance Employee was successfully removed.'
  end
  
  private
  def maintenance_staff_params
    params.require(:maintenance_staff).permit(:first_name, :last_name)
  end
end
