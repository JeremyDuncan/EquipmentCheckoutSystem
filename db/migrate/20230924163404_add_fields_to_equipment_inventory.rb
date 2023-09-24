class AddFieldsToEquipmentInventory < ActiveRecord::Migration[7.0]
  def change
    add_column :equipment_inventories, :equipment_name, :string
    add_column :equipment_inventories, :equipment_id, :string, unique: true
    add_column :equipment_inventories, :status, :integer, default: 0 # Enum
    add_reference :equipment_inventories, :maintenance_staffs, null: true, foreign_key: true
  end
end
