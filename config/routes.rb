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
  resources :employee_records
  resources :reports
  
  ##############################################################################
  ## Custom ROUTES ##
  ###################
  resources :equipment_inventories do
    member do
      post :toggle_status
    end
  end
  resources :hr_staffs do
    collection do
      post :create_employee
    end
  end
end
