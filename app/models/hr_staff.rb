class HrStaff < ApplicationRecord
  has_many :employee_records

  #TODO=> SETUP METHODS
  def full_name
    "#{first_name} #{last_name}"
  end
end
