Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  ##############################################################################
  ## ROOT LOCATION ##
  ###################
  root "dashboard#index"
  
  ##############################################################################
  ## DEVISE ROUTES ##
  ###################
  # devise_for :hr_staffs
  devise_for :management_staffs
  devise_for :maintenance_staffs
  devise_for :hr_staffs, controllers: { registrations: 'hr_staffs/registrations' }
  
  
  get 'new_user_session' => 'sessions#new', as: :new_user_session

  
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
  
  post 'create_employee', to: 'hr_staffs#create_employee'
end
