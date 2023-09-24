class CreateHrStaffs < ActiveRecord::Migration[7.0]
  def change
    create_table :hr_staffs do |t|

      t.timestamps
    end
  end
end
