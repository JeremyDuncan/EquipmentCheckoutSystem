class AddPolymorphicFieldsToEmployeeRecords < ActiveRecord::Migration[7.0]
  def change
    add_column :employee_records, :employee_id, :integer
    add_column :employee_records, :employee_type, :string
    add_column :employee_records, :status, :integer, default: 0
    add_column :employee_records, :last_updated_by, :integer
    add_index :employee_records, [:employee_type, :employee_id]
    add_index :employee_records, :last_updated_by
  end
end
