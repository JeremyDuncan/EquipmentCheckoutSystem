class MaintenanceStaff < ApplicationRecord
  has_many :equipment_inventories

  #TODO=> SETUP METHODS
  def full_name
    "#{first_name} #{last_name}"
  end

end
