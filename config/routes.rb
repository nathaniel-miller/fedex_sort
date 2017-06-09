Rails.application.routes.draw do


  resources :responsibilities
  resources :setups
  resources :sorts
  resources :sort_types
  resources :rosters
  devise_for :users
  resources :schedules
  resources :team_members
  resources :positions

  root to: "home#index"

  get '/dashboard', to: "home#dashboard", as: 'dashboard'
  get '/employees', to: "team_members#index", as: 'employees'

  get "/add_dates_unavailable/" => 'team_members#add_dates_unavailable', as: 'add_dates_unavailable'
  get "/remove_dates_unavailable/:id" => 'team_members#remove_dates_unavailable', as: 'remove_dates_unavailable'

end
