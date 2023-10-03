class AddCheckInStatusToReports < ActiveRecord::Migration[7.0]
  def change
    add_column :reports, :check_in_status, :integer
  end
end
