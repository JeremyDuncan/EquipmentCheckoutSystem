class AddDeletedToEquipmentInventories < ActiveRecord::Migration[7.0]
  def change
    add_column :equipment_inventories, :deleted, :boolean, default: false
  end

end
