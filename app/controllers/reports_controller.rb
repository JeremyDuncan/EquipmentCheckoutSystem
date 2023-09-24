class ReportsController < ApplicationController
  def index
    @reports= Report.all
  end

  def generate
    @report = Report.find(params[:id])
    @report.generate
  end

end
