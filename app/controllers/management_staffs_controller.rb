class ManagementStaffsController < ApplicationController
  def index
    @management_staffs = ManagementStaff.all
  end

end
