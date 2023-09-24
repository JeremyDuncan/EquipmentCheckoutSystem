class HrStaff < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :employee_records
  has_one :employee_record, as: :employee
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable


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
