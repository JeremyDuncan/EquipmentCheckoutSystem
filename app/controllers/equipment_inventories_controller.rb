class EquipmentInventoriesController < ApplicationController
  def index
    @equipment_inventories = EquipmentInventory.all
  end
  
  # =======================================================
  # Initialize a new EquipmentInventory object for the form
  # -------------------------------------------------------
  def new
    @equipment_inventory = EquipmentInventory.new
  end
  def create
    @equipment_inventory = EquipmentInventory.new(equipment_inventory_params)
    if @equipment_inventory.save
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
      @equipment_inventory.update(status: 1) # Checked out
    else
      @equipment_inventory.update(status: 0) # Checked in
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
    @equipment_inventory.destroy
    redirect_to equipment_inventories_path, notice: 'Equipment was successfully deleted.'
  end
  
  
  private
  def equipment_inventory_params
    params.require(:equipment_inventory).permit(:equipment_name, :equipment_id, :status)
  end  
  
end
