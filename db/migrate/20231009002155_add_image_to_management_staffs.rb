class AddImageToManagementStaffs < ActiveRecord::Migration[7.0]
  def change
    add_column :management_staffs, :image, :string
  end
end
