class CreateEquipmentMovements < ActiveRecord::Migration[7.0]
  def change
    create_table :equipment_movements do |t|
      t.bigint   :equipment_inventory_id, null: false
      t.bigint   :maintenance_staff_id, null: false
      t.datetime :moved_at, null: false
      t.string   :action, null: false # This will be either 'check_in' or 'check_out'
      t.timestamps
    end

    add_index :equipment_movements, :equipment_inventory_id
    add_index :equipment_movements, :maintenance_staff_id
    add_foreign_key :equipment_movements, :equipment_inventories
    add_foreign_key :equipment_movements, :maintenance_staffs
  end
end
