class ChangeColumnsInReports < ActiveRecord::Migration[7.0]
  def change
    remove_column :reports, :date_range, :string
    add_column :reports, :start_date, :date
    add_column :reports, :end_date, :date
  end
  end
