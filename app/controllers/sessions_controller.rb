class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:new]
  def index
  end
  
  
  def new
  end
  
  def create
    staff_type = params[:staff_type]
    email      = params[:email]
    password   = params[:password]

    # authentication logic here based on staff_type, email, and password
  end
  
  

end
