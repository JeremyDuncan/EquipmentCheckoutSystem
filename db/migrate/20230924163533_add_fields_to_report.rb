class AddFieldsToReport < ActiveRecord::Migration[7.0]
  def change
    add_column :reports, :report_type, :string
    add_reference :reports, :management_staffs, null: true, foreign_key: true
    add_column :reports, :date_range, :string
    add_column :reports, :metrics_included, :string
  end
end
