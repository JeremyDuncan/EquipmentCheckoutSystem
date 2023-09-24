Rails.application.routes.draw do
  ##############################################################################
  ## Root route ##
  ################
  root to: 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  ##############################################################################
  ## Main routes ##
  #################
  resources :maintenance_staffs
  resources :management_staffs
  resources :hr_staffs
  resources :equipment_inventories
  resources :employee_records
  resources :reports

  ##############################################################################
  ## DEVISE ROUTES ##
  ###################
  # devise_for :maintenance_staffs
  # devise_for :management_staffs
  # devise_for :hr_staffs
  devise_for :maintenance_staffs, path: 'auth/maintenance_staffs'
  devise_for :management_staffs, path: 'auth/management_staffs'
  devise_for :hr_staffs, path: 'auth/hr_staffs'
end
