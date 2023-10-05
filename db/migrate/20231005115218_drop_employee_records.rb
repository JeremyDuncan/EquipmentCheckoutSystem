class DropEmployeeRecords < ActiveRecord::Migration[7.0]
  def up
    drop_table :employee_records
  end
end
