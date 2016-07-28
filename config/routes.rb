Rails.application.routes.draw do

  root 'application#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show]
  resources :projects do
    resources :characters, only: [:index]
    resources :plot_points
    resources :chapters, only: [:index, :new, :create]
  end

  resources :chapters, except: [:index, :new, :create] do
    resources :characters
    resources :plot_points
  end

  resources :characters


end
