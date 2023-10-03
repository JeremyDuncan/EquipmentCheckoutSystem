class Report < ApplicationRecord
  belongs_to :management_staff, foreign_key: 'management_staffs_id'
  

  #TODO=> SETUP METHODS
  # ==================
  # Generates a report
  # ------------------
  def generate
    # Your logic here
  end
end
