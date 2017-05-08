Rails.application.routes.draw do


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

end
