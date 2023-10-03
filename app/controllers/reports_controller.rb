class ReportsController < ApplicationController
  include ConsoleColors
  def index
    @reports= Report.all
  end

  def generate
    @report = Report.find(params[:id])
    @report.generate
  end
  
  # ==============================================================================
  # This method handles the creation of a new report. It initializes a new report
  # object, sets its attributes, and then attempts to save it to the database.
  # ------------------------------------------------------------------------------
  def create
    @report = Report.new(report_params.slice(:report_type, :maintenance_staffs_id, :check_in_status, :date_range))
    
    # Set the default management_staffs_id (replace 1 with the actual ID you want)
    @report.management_staffs_id = 1
    if @report.save
      # Handle successful save, for example, redirect to the report show page
      redirect_to @report
    else
      # Handle unsuccessful save, for example, render the new template again
      debug(@report.errors.full_messages, "Validation Errors")
      render 'new'
    end
  end
  
  def show
    @report = Report.find(params[:id])
    debug(@report, "@report")
    @maintenance_staff = MaintenanceStaff.find(@report[:maintenance_staffs_id])
    debug(@maintenance_staff, "@maintenance_staff")
    
    @queried_equipment = EquipmentInventory.where(maintenance_staffs_id: @maintenance_staff.id)
                                           .where(status: @report[:check_in_status])
                                           .order(created_at: :desc)
    
    debug(@queried_equipment, "@queried_equipment")
  end
  
  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    redirect_to reports_path, notice: 'Report was successfully removed.'
  end

  private
  # ==============================================================================
  # This method defines the permitted parameters for creating or updating a report.
  # ------------------------------------------------------------------------------
  def report_params
    params.permit(:report_type, :maintenance_staffs_id, :check_in_status, :date_range, :authenticity_token)
  end

  
end
