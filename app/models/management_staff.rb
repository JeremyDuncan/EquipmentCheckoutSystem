class ManagementStaff < ApplicationRecord
  has_many :equipment_inventories
  has_many :reports
  
  #TODO=> SETUP METHODS
  def full_name
    "#{first_name} #{last_name}"
  end
end
