class HrStaffsController < ApplicationController

  def index
    @hr_staffs = HrStaff.all
  end

end
