class EmployeeRecordsController < ApplicationController
  def index
    @employee_records = EmployeeRecord.all
  end

end
