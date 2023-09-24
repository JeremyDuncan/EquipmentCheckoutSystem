class CreateEquipmentInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :equipment_inventories do |t|

      t.timestamps
    end
  end
end
