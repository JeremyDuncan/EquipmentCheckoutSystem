class CreateMaintenanceStaffs < ActiveRecord::Migration[7.0]
  def change
    create_table :maintenance_staffs do |t|

      t.timestamps
    end
  end
end
