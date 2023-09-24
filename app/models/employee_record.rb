class EmployeeRecord < ApplicationRecord
  belongs_to :employee, polymorphic: true

  #TODO=> SETUP METHODS
  def full_name
    "#{first_name} #{last_name}"
  end

  # =======================
  # Updates employee status
  # -----------------------
  def update_employee_status
    # Your logic here
  end
end