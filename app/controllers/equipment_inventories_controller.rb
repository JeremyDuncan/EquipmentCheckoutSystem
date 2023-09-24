class EquipmentInventoriesController < ApplicationController

  def index
    @equipment_inventories = EquipmentInventory.all
  end
  # Custom method to update equipment status
  def update_equipment_status
    @equipment_inventory = EquipmentInventory.find(params[:id])
    @equipment_inventory.update_equipment_status
  end

  # Custom method to record equipment condition
  def record_equipment_condition
    @equipment_inventory = EquipmentInventory.find(params[:id])
    @equipment_inventory.record_equipment_condition
  end

end
