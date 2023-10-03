class RemoveEquipmentInventoryIdFromMaintenanceStaffs < ActiveRecord::Migration[7.0]
  def change
    remove_column :maintenance_staffs, :equipment_inventory_id, :bigint
  end
end
