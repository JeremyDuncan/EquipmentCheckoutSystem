class ManagementStaff < ApplicationRecord
  #TODO=> SETUP METHODS
  def full_name
    "#{first_name} #{last_name}"
  end
end
