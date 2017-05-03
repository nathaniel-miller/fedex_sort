Rails.application.routes.draw do


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"

  get '/dashboard', to: "home#dashboard", as: 'dashboard'

  resources :schedules
  resources :team_members
  resources :positions

end
