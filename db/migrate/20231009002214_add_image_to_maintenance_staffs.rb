class AddImageToMaintenanceStaffs < ActiveRecord::Migration[7.0]
  def change
    add_column :maintenance_staffs, :image, :string
  end
end
