class CreateManagementStaffs < ActiveRecord::Migration[7.0]
  def change
    create_table :management_staffs do |t|

      t.timestamps
    end
  end
end
