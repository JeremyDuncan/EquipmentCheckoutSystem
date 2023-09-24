class MaintenanceStaff < ApplicationRecord
  has_many :equipment_inventories, dependent: :nullify
  has_one :employee_record, as: :employee


  #TODO=> SETUP METHODS
  def full_name
    "#{first_name} #{last_name}"
  end

  # ====================
  # Checks out equipment
  # --------------------
  def check_out_equipment
    # Your logic here
  end

  # ===================
  # Checks in equipment
  # -------------------
  def check_in_equipment
    # Your logic here
  end

end
