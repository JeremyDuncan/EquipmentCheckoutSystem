class ReportsController < ApplicationController
  def index
    @reports= Report.all
  end

  def generate
    #TODO
  end

end
