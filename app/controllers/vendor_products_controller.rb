class VendorProductsController < ApplicationController
    before_action :authenticate_vendor_request!
    def create
        product = Product.find params[:product_id]
        if vendor_product = product.vendor_products.create(vendor_id: current_vendor.id)
            redner json: vendor_product , status: :created
        else
            render json: vendor_product.errors, status: :bad_request
        end
        
    end
end
