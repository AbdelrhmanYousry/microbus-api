class ProductsController < ApplicationController
  before_action  :authenticate_vendor_request!

  def index
    products = Product.all

    render json: products
  end

end
