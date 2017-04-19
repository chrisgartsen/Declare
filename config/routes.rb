Rails.application.routes.draw do

  get 'accounts/show'

  resources :users
  resources :projects
  resources :sessions, only: [:new, :create, :destroy]
  resources :contact_messages, only: [:new, :create, :index, :show]

  # User related
  get 'users/new'
  get '/signup', to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new', as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  # Static Pages
  get '/static_pages/:page', to: 'static_pages#show'
  get '/home',    to: 'static_pages#show', page: 'home'
  get '/contact', to: 'static_pages#show', page: 'contact'
  get '/about',   to: 'static_pages#show', page: 'about'

  root 'static_pages#show', page: 'home'

end
