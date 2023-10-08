class AllowNullInMaintenanceStaffIdForEquipmentMovements < ActiveRecord::Migration[7.0]
  def change
    change_column_null :equipment_movements, :maintenance_staff_id, true
  end
end
