Rails.application.routes.draw do

  get 'dashboard/show'

  resources :users
  resources :currencies, only: [:index]
  resources :expense_types, only: [:index]
  resources :payment_types, only: [:index]
  resources :projects
  resources :sessions, only: [:new, :create, :destroy]
  resources :contact_messages, only: [:new, :create, :index, :show]

  # User related
  get 'users/new'
  get '/signup', to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new', as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get 'accounts/show'

  # Static Pages
  get '/static_pages/:page', to: 'static_pages#show'
  get '/home',    to: 'static_pages#show', page: 'home'
  get '/contact', to: 'contact_messages#new'
  get '/about',   to: 'static_pages#show', page: 'about'


  constraints AuthenticatedRouteConstraint.new do
    root 'accounts#show'
  end

  root 'static_pages#show', page: 'home'

end
