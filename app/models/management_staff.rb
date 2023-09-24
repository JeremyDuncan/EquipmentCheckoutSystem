class ManagementStaff < ApplicationRecord
  has_many :equipment_inventories
  has_many :reports
  has_one :employee_record, as: :employee

  #TODO=> SETUP METHODS
  def full_name
    "#{first_name} #{last_name}"
  end

  # ===========================
  # Reviews equipment inventory
  # ---------------------------
  def review_equipment_inventory
    # Your logic here
  end

  # ================================
  # Generates equipment usage report
  # --------------------------------
  def generate_equipment_usage_report
    # Your logic here
  end
end
