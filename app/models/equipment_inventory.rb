class EquipmentInventory < ApplicationRecord
  belongs_to :maintenance_staff, optional: true
  belongs_to :management_staff, optional: true


  #TODO=> SETUP METHODS
  # Check-in equipment
  def check_in
    # TODO
  end

  # Check-out equipment
  def check_out
    #TODO
  end
  # ========================
  # Updates equipment status
  # ------------------------
  def update_equipment_status
    # Your logic here
  end

  # ===========================
  # Records equipment condition
  # ---------------------------
  def record_equipment_condition
    # Your logic here
  end


end
