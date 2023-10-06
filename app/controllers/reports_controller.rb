class ReportsController < ApplicationController
  include ConsoleColors
  
  def index
    start = params[:start].to_i
    limit = params[:limit].to_i
    @reports = Report.order(id: :desc).offset(start).limit(limit)
  
    respond_to do |format|
      format.html # This will render the usual HTML view
      format.json { render json: { reports: @reports.map { |r| r.attributes.merge({ full_name: ManagementStaff.find_by(id: r.management_staffs_id)&.full_name }) } } }
    end
  end

  def generate
    @report = Report.find(params[:id])
    @report.generate
  end
  
  def new
    @report = Report.new
  end
  
  # =========================================================================
  # handles the creation of a new report. It initializes a new report
  # object, sets its attributes, and then attempts to save it to the database
  # -------------------------------------------------------------------------
  def create
    @report = Report.new(report_params)
    @report.management_staffs_id = current_management_staff.id if management?
    
    # Set check_in_status based on report_type
    case @report.report_type
    when 'Checked In'
      @report.check_in_status = 0  
    when 'Checked Out'
      @report.check_in_status = 1  
    when 'All'
      @report.check_in_status = nil
    when 'Removed'
      @report.check_in_status = -1  
    end
    
    if @report.save
      # Handle successful save, for example, redirect to the report show page
      redirect_to @report
    else
      # Handle unsuccessful save, for example, render the new template again
      debug(@report.errors.full_messages, "Validation Errors")
      render 'new'
    end
  end
  
  # ============================================================================
  # The show action fetches a report based on its ID and then queries the
  # EquipmentInventory based on the report's parameters. If a parameter is nil,
  # it is ignored in the query.
  # ----------------------------------------------------------------------------
  def show
    @report = Report.find(params[:id])
    debug(@report, "report")
    @queried_equipment = EquipmentInventory.all
    @equipment_history = EquipmentMovement.all
    
    if @report.maintenance_staffs_id.present?
      @maintenance_staff = MaintenanceStaff.find(@report.maintenance_staffs_id)
      @queried_equipment = @queried_equipment.where(maintenance_staffs_id: @maintenance_staff.id)
    end
  
    if @report.check_in_status.present?
      if @report.check_in_status == -1
        @queried_equipment = @queried_equipment.where(deleted: true)
      else
        @queried_equipment = @queried_equipment.where(status: @report.check_in_status) 
      end
    end
    
    if @report.start_date.present? && @report.end_date.present?
      start_date  = @report.start_date
      end_date    = @report.end_date
      date_column = @report.check_in_status == 0 ? 'last_checked_in_at' : 'last_checked_out_at'
      @queried_equipment = @queried_equipment.where("#{date_column} BETWEEN ? AND ?", start_date, end_date)
    end
    
    equipment_inventory_ids = @queried_equipment.pluck(:id)
    @equipment_history = EquipmentMovement
                           .where(equipment_inventory_id: equipment_inventory_ids)
                           .order(moved_at: :desc)
    @queried_equipment = @queried_equipment.order(created_at: :desc)
    debug(@queried_equipment, "@queried_equipment")
  end
  
  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    redirect_to reports_path, notice: 'Report was successfully removed.'
  end

  private
  # ==================================================================
  # Defines the permitted parameters for creating or updating a report
  # ------------------------------------------------------------------
  def report_params
    params.require(:report).permit(:report_type, 
                                          :maintenance_staffs_id,
                                          :check_in_status, 
                                          :start_date, 
                                          :end_date,
                                          :authenticity_token)
  end
end