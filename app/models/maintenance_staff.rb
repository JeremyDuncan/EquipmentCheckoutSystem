class MaintenanceStaff < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise   :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
  
  has_many :equipment_inventories, foreign_key: 'maintenance_staffs_id', dependent: :nullify
  has_one :employee_record, as: :employee
  # ======================================================================
  # This validation ensures that both first_name and last_name are present 
  # before saving the model.
  # ----------------------------------------------------------------------
  validates :first_name, :last_name, presence: true

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
