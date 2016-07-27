Rails.application.routes.draw do

  root 'application#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show]
  resources :projects do
    resources :chapters, only: [:new, :create]
  end

  resources :chapters, except: [:new, :create]
  resources :characters
  resources :plot_points

end
