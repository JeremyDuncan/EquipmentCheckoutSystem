class Report < ApplicationRecord
  belongs_to :management_staff, foreign_key: 'management_staffs_id'
  validates :start_date, presence: true
  validates :end_date, presence: true

  
  def checked_out?
    check_in_status == 1
  end
  def checked_in?
    check_in_status == 0
  end
  def removed?
    check_in_status == -1
  end
  def created?
    check_in_status == 0
  end
  
end
