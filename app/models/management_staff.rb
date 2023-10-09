class ManagementStaff < ApplicationRecord
  mount_uploader :image, ManagementImageUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :equipment_inventories
  has_many :reports
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
