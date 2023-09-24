class EquipmentInventoriesController < ApplicationController

  def index
    @equipment_inventories = EquipmentInventory.all
  end
end
