Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :vendor_products, only: :create
 resources :wishlists, only: :create  

end
