class AddImageToHrStaffs < ActiveRecord::Migration[7.0]
  def change
    add_column :hr_staffs, :image, :string
  end
end
