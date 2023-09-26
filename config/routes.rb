Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  ##############################################################################
  ## ROOT LOCATION ##
  ###################
  root "dashboard#index"
  
  ##############################################################################
  ## MAIN ROUTES ##
  #################
  resources :maintenance_staffs
  resources :management_staffs
  resources :hr_staffs
  resources :equipment_inventories
  resources :employee_records
  resources :reports
end
