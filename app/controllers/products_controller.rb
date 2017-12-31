class ProductsController < ApplicationController
  before_action  :session_info_check!

  def index
    products = Product.all

    render json: products
  end

  def autocomplete
   render json: Product.search(params[:query], {
     fields: ["name"],
     match: :word_start,
     limit: 10,
     load: false,
     misspellings: false,
   }).map()
 end

end
