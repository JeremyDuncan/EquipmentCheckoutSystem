class EquipmentMovement < ApplicationRecord
  ACTIONS = ['check_in', 'check_out', 'deleted', 'restored', 'created']
  validates :action, inclusion: { in: ACTIONS }
  

end
