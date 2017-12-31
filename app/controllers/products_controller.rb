class ProductsController < ApplicationController
  before_action  :session_info_check!

  def index
    products = Product.all

    render json: products
  end

end
