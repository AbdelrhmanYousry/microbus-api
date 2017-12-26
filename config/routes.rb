Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :consumer_registrations, only: :create
  post 'consumer/login', to: 'consumer_sessions#login'

end
