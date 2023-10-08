class UpdateForeignKeyForEquipmentMovements < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :equipment_movements, :maintenance_staffs
    add_foreign_key :equipment_movements, :maintenance_staffs, on_delete: :nullify
  end
end
