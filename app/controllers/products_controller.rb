class ProductsController < ApplicationController
  before_action  :authenticate_request!

  def index
    products = Product.all
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
