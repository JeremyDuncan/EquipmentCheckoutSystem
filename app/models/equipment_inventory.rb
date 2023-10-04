class EquipmentInventory < ApplicationRecord
  # belongs_to :maintenance_staff, optional: true
  belongs_to :management_staff,  optional: true
  # =====================================================================
  # This validation ensures that both equipment_id and equipment_name are 
  # present before saving the model.
  # ---------------------------------------------------------------------
  validates :equipment_id, :equipment_name, presence: true

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


  # ======================================
  # Checks if the equipment is checked out
  # --------------------------------------
  def checked_out?
    status == 1
  end
  # =====================================
  # Checks if the equipment is checked in
  # -------------------------------------
  def checked_in?
    status == 0
  end
  
  def name
    equipment_name
  end
  
  def serial
    equipment_id
  end
  
  def checked_out_name
    if checked_out?
      checked_out_by
    end
  end
  
  def checked_in_name
    if checked_in?
      checked_in_by
    end
  end
  
end
