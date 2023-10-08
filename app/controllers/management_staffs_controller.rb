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

  # =======================================================
  # Initialize a new Management Staff object for the form
  # -------------------------------------------------------
  def new
    @management_staff = ManagementStaff.new
  end
  def create
    @management_staff = ManagementStaff.new(management_staff_params)
    if @management_staff.save
      redirect_to management_staffs_path, notice: 'Management Employee was successfully added.'
    else
      flash.now[:alert] = @management_staff.errors.full_messages.join(", ")
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('alert',
                                                                        partial: 'turbo_layouts/alert',
                                                                        locals: { alert: flash.now[:alert] }) }
        format.html { render :new }
      end
    end
  end

  def edit
    @management_staff = ManagementStaff.find(params[:id])
  end

  def update
    @management_staff = ManagementStaff.find(params[:id])
    if @management_staff.update(management_staff_params)
      redirect_to management_staffs_path, notice: 'Management Employee was successfully updated.'
    else
      flash.now[:alert] = @management_staff.errors.full_messages.join(", ")
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('alert',
                                                                        partial: 'turbo_layouts/alert',
                                                                        locals: { alert: flash.now[:alert] }) }
        format.html { render :edit }
      end
    end
  end

  def show
    @management_staff = ManagementStaff.find(params[:id])
  end

  def destroy
    @management_staff = ManagementStaff.find(params[:id])
    @management_staff.destroy
    current_letter = params[:current_letter]
    redirect_to hr_staffs_path(initial_letter: current_letter, role: "ManagementStaff")
  end

  private
  def management_staff_params
    params.require(:management_staff).permit(:first_name, :last_name, :role)
  end





end
