Rails.application.routes.draw do

  get 'characters/index'

  get 'characters/new'

  get 'characters/show'

  get 'characters/edit'

  get 'characters/create'

  get 'characters/update'

  get 'characters/destroy'

  root 'application#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show]
  resources :projects
  resources :chapters
  resources :characters
  resources :plot_points

end
