Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  ##############################################################################
  ## ROOT LOCATION ##
  ###################
  root "dashboard#index"
  
  ##############################################################################
  ## DEVISE ROUTES ##
  ###################
  devise_for :hr_staffs,          path: 'hr_staffs',          controllers: { sessions: 'hr_staffs/sessions', registrations: 'hr_staffs/registrations' }
  devise_for :maintenance_staffs, path: 'maintenance_staffs', controllers: { sessions: 'maintenance_staffs/sessions' }
  devise_for :management_staffs,  path: 'management_staffs',  controllers: { sessions: 'management_staffs/sessions' }
  
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
