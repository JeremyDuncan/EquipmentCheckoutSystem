class AddFieldsToHrStaff < ActiveRecord::Migration[7.0]
  def change
    add_column :hr_staffs, :first_name, :string
    add_column :hr_staffs, :last_name, :string
    add_column :hr_staffs, :employee_record_id, :string, unique: true
    add_column :hr_staffs, :role, :string
  end
end
