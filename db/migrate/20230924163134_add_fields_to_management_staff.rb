class AddFieldsToManagementStaff < ActiveRecord::Migration[7.0]
  def change
    add_column :management_staffs, :first_name, :string
    add_column :management_staffs, :last_name, :string
    add_column :management_staffs, :employee_record_id, :string, unique: true
    add_column :management_staffs, :role, :string
  end
end
