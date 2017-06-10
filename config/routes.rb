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

  get "/add_dates_unavailable/", to: 'team_members#add_dates_unavailable', as: 'add_dates_unavailable'
  get "/remove_dates_unavailable/:id", to: 'team_members#remove_dates_unavailable', as: 'remove_dates_unavailable'

  get "/add_permanent_position", to: 'team_members#add_permanent_position', as: 'add_permanent_position'
  get "/remove_permanent_position/:id", to: 'team_members#remove_permanent_position', as: 'remove_permanent_position'

end
