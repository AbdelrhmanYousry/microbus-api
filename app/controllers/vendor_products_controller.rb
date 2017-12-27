class VendorProductsController < ApplicationController
    def create
        product = find the product with title  = params[:name]
        if product exists?
            VendorProduct.create(prod.id, current_vendor)
        else
            if new_product = Product.create(product_prams)
                VendorProduct.create(new_prod.id, current_vendor)
            else
                
            end

        end
    end

    def product_prams
        :vendor_id, :product_id
        params.requeire(:product).permit(:name, ...)
    end
end
