Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :consumer_registrations, only: :create
  post 'consumer/login', to: 'consumer_sessions#login'
  get '/products', to: 'products#index'
  get '/current_user', to: 'fetch_user#show'
  get '/search', to: 'products#autocomplete'
  get '/wishlists', to: 'wishlists#index'
  get '/vendor_products', to: 'vendor_products#index'
  post '/vendor_products', to: 'vendor_products#create'
  post '/wishlists', to: 'wishlists#create'
  post '/consumer/addproduct', to: 'wishlists#createAndAdd'
  delete '/consumer/deleteproduct', to: 'wishlists#destroy'
  delete '/vendor/deleteproduct', to: 'vendor_products#destroy'
  post '/vendor/addproduct', to: 'vendor_products#createAndAdd'
  resources :vendor_registrations, only: :create
  resources :vendor_products, only: :show 
  post 'vendor/login', to: 'vendor_sessions#login'
  # get '/current_vendor', to: 'fetch_vendor#show'

end
