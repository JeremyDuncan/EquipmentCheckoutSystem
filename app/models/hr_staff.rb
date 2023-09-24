class HrStaff < ApplicationRecord
  has_many :employee_records
  has_one :employee_record, as: :employee

  #TODO=> SETUP METHODS
  def full_name
    "#{first_name} #{last_name}"
  end

  # ========================
  # Updates employee records
  # ------------------------
  def update_employee_records
    # Your logic here
  end
end
