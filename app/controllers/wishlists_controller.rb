class WishlistsController < ApplicationController
    before_action :authenticate_request!
    def create
        product = Product.find params[:product_id]
        if wishlist = product.wishlists.create(consumer_id: current_consumer.id)
            redner json: wishlist, status: :created
        else
            render json: wishlist.errors, status: :bad_request
        end
        
    end
end
