class AddImageToTools < ActiveRecord::Migration[7.0]
  def change
    add_column :equipment_inventories, :image, :string
  end
end
