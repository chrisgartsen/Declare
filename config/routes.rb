Rails.application.routes.draw do

  # Static Pages
  get '/static_pages/:page', to: 'static_pages#show'
  get '/home',    to: 'static_pages#show', page: 'home'
  get '/contact', to: 'static_pages#show', page: 'contact'
  get '/about',   to: 'static_pages#show', page: 'about'

  root 'static_pages#show', page: 'home'

end
