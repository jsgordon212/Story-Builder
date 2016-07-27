Rails.application.routes.draw do

  root 'application#index'

  get 'login', to: 'sessions#new'
  get 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show]
  resources :projects
  resources :chapters
  resources :characters
  resources :plot_points

end
