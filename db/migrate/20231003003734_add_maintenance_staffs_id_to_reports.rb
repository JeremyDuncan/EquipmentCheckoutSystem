class AddMaintenanceStaffsIdToReports < ActiveRecord::Migration[7.0]
  def change
    add_column :reports, :maintenance_staffs_id, :bigint
  end
end
