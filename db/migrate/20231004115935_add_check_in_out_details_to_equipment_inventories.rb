class AddCheckInOutDetailsToEquipmentInventories < ActiveRecord::Migration[7.0]
  def change
    add_column :equipment_inventories, :last_checked_out_by, :string
    add_column :equipment_inventories, :last_checked_out_at, :datetime
    add_column :equipment_inventories, :last_checked_in_by, :string
    add_column :equipment_inventories, :last_checked_in_at, :datetime
  end
end
