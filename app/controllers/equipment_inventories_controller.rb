class EquipmentInventoriesController < ApplicationController
  # ==============================================================================
  # This method handles the index action for the EquipmentInventoriesController.
  # It sets up pagination, applies filters based on the initial letter and status,
  # and calculates the total number of pages and records.
  # ------------------------------------------------------------------------------
  def index
    # Pagination
    @page = params[:page].to_i
    @page = 1 if @page.zero?
    per_page = 10
    offset = (@page - 1) * per_page

    # Filtering
    @initial_letter = params[:initial_letter] || 'A'  # Default to 'A'
    @status = params[:status]

    # Base query
    base_query = EquipmentInventory.where(deleted: false)

    # Apply initial letter filter if present
    filtered_query = base_query.where("equipment_name LIKE ?", "#{@initial_letter}%") if @initial_letter.present?

    # Apply status filter if present
    filtered_query = filtered_query.where(status: @status) if @status.present?

    # Calculate total pages for pagination
    @total_pages = (filtered_query.count.to_f / per_page).ceil

    # Apply pagination and ordering
    @equipment_inventories = filtered_query.offset(offset).limit(per_page).order(id: :desc)

    # Set the total number of records based on your current filters
    @total_records = filtered_query.count
    @grand_total_records = EquipmentInventory.all.count
  end

  # =======================================================
  # Initialize a new EquipmentInventory object for the form
  # -------------------------------------------------------
  def new
    @equipment_inventory = EquipmentInventory.new
  end
  def create
    @equipment_inventory = EquipmentInventory.new(equipment_inventory_params)
    @equipment_inventory.maintenance_staffs_id = current_maintenance_staff.id if maintenance?
    @equipment_inventory.last_checked_in_by = current_staff.full_name
    @equipment_inventory.last_checked_in_at = Time.now
    
    if @equipment_inventory.save
      record_movement('created')
      
      redirect_to equipment_inventories_path, notice: 'Equipment was successfully added.'
    else
      flash.now[:alert] = @equipment_inventory.errors.full_messages.join(", ")
        respond_to do |format|
          format.turbo_stream { render turbo_stream: turbo_stream.replace('alert', 
                                                                          partial: 'turbo_layouts/alert', 
                                                                          locals: { alert: flash.now[:alert] }) }
          format.html { render :edit }
      end
    end
  end
  
  def edit
    @equipment_inventory = EquipmentInventory.find(params[:id])
  end
  
  def update
    @equipment_inventory = EquipmentInventory.find(params[:id])
  
    if @equipment_inventory.update(equipment_inventory_params)
      redirect_to equipment_inventories_path, notice: 'Equipment was successfully updated.'
    else
      flash.now[:alert] = @equipment_inventory.errors.full_messages.join(", ")
        respond_to do |format|
          format.turbo_stream { render turbo_stream: turbo_stream.replace('alert', 
                                                                          partial: 'turbo_layouts/alert', 
                                                                          locals: { alert: flash.now[:alert] }) }
          format.html { render :edit }
      end
    end
  end
  def show
    @equipment_inventory = EquipmentInventory.find(params[:id])
  end
  
  # Custom method to update equipment status
  def update_equipment_status
    @equipment_inventory = EquipmentInventory.find(params[:id])
    @equipment_inventory.update_equipment_status
  end

  
  # =======================
  # toggle equipment status
  # -----------------------
  def toggle_status
    @equipment_inventory = EquipmentInventory.find(params[:id])
    if @equipment_inventory.checked_in?
      @equipment_inventory.update(status: 1, 
                                   last_checked_out_by: current_staff.full_name,
                                   last_checked_out_at: Time.now) # Checked out
      record_movement('check_out')
    else
      @equipment_inventory.update(status: 0, 
                                   last_checked_in_by: current_staff.full_name,
                                   last_checked_in_at: Time.now) # Checked in
      record_movement('check_in')
    end
    render json: { status: @equipment_inventory.status }
  end

  # Custom method to record equipment condition
  def record_equipment_condition
    @equipment_inventory = EquipmentInventory.find(params[:id])
    @equipment_inventory.record_equipment_condition
  end

  
  # ============================================================================
  # Deletes a piece of equipment based on its ID and redirects to the index page
  # ----------------------------------------------------------------------------
  def destroy
    @equipment_inventory = EquipmentInventory.find(params[:id])
    @equipment_inventory.update(deleted: true)
    record_movement('deleted')
    redirect_to equipment_inventories_path, notice: 'Equipment was successfully marked as deleted.'
  end

  def restore
    @equipment_inventory = EquipmentInventory.find(params[:id])
    @equipment_inventory.update(deleted: false)
    record_movement('restored')
    redirect_to equipment_inventories_path, notice: 'Equipment was successfully restored.'
  end
  
  
  
  private
  def equipment_inventory_params
    # params.require(:equipment_inventory).permit(:equipment_name, :equipment_id, :status)
    params.require(:equipment_inventory).permit(:equipment_name, 
                                                :equipment_id, 
                                                :status, 
                                                :last_checked_out_by, 
                                                :last_checked_out_at, 
                                                :last_checked_in_by, 
                                                :last_checked_in_at)
  end
  
  def record_movement(action)
    EquipmentMovement.create!(
      equipment_inventory_id: @equipment_inventory.id,
      maintenance_staff_id:   current_maintenance_staff&.id,
      moved_at:               Time.now,
      action:                 action
    )
  end
end
