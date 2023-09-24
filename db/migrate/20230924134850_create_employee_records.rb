class CreateEmployeeRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_records do |t|

      t.timestamps
    end
  end
end
