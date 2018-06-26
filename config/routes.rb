Rails.application.routes.draw do
  get 'display_software_info/display_info'
  use_doorkeeper do
    skip_controllers :applications, :authorized_applications
  end

  namespace :api do
    post "login"  => "sessions#create"
    delete "logout" => "sessions#destroy"
    resources :users
  end

  get "login" 	=> "sessions#login"
  post "login" 	=> "sessions#create"
  delete "logout" 	=> "sessions#destroy"

  get "dashboard" => "dashboard#dashboard"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users

  root "users#index"
end
