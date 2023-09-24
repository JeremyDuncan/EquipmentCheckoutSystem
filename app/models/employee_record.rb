class EmployeeRecord < ApplicationRecord
  belongs_to :hr_staff


  #TODO=> SETUP METHODS
  def full_name
    "#{first_name} #{last_name}"
  end

end
