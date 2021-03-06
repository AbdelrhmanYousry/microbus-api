Rails.application.routes.draw do

  get 'latest_offers/fetchLatestOffers'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
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
  resources :offers, only: [:create, :show, :index]
  post 'vendor/login', to: 'vendor_sessions#login'
  resources :current_vendor_offers, only: :index
  resources :charges
  post '/charge_makmaks', to: 'makmak_charges#charge'
  post '/offer/buy', to: 'transactions#buy'
  # get '/current_vendor', to: 'fetch_vendor#show'
  get '/top_offers', to: 'top_offers#fetchTopOffers'
  get '/bought_offers', to: 'offers#consumer_offers'
  get '/consumer/notifications', to: 'notifications#index'
  get '/consumer/latest_notifications', to: 'fetch_notifications#fetch_latest_notifications'
  patch '/consumer/notifications/:id', to: 'fetch_notifications#mark_as_read'
  get '/vendor/notifications', to: 'vendor_notifications#index'
  get '/vendor/latest_notifications', to: 'fetch_vendor_notifications#fetch_latest_notifications'
  patch '/vendor/notifications/:id', to: 'fetch_vendor_notifications#mark_as_read'

  get '/latest_offers', to: 'latest_offers#fetchLatestOffers'

end
