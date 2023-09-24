class AddColumnsToMaintenanceStaff < ActiveRecord::Migration[7.0]
  def change
    add_column :maintenance_staffs, :first_name, :string
    add_column :maintenance_staffs, :last_name, :string
    add_column :maintenance_staffs, :employee_record_id, :string
    add_index :maintenance_staffs, :employee_record_id, unique: true
    add_reference :maintenance_staffs, :equipment_inventory, foreign_key: true
  end
end
