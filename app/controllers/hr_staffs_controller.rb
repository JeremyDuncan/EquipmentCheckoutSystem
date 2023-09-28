class HrStaffsController < ApplicationController

  def index
    @hr_staffs = HrStaff.all
  end
  
  # =======================================================
  # Initialize a new HR Staff object for the form
  # -------------------------------------------------------
  def new
    @hr_staff = HrStaff.new
  end
  def create
    @hr_staff = HrStaff.new(hr_staff_params)
    if @hr_staff.save
      redirect_to hr_staffs_path, notice: 'HR Employee was successfully added.'
    else
      flash.now[:alert] = @hr_staff.errors.full_messages.join(", ")
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('alert', 
                                                                        partial: 'turbo_layouts/alert', 
                                                                        locals: { alert: flash.now[:alert] }) }
        format.html { render :new }
      end
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
