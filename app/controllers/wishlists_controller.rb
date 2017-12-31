class WishlistsController < ApplicationController
  before_action :authenticate_request!

  def index
  @wishlists = @current_user.wishlists
  end

  def create
  @wishlist = @current_user.wishlists.create(product_params)
  end

  def createAndAdd
  @product = Product.new(new_params)

  if @product.save
    @wishlist = @current_user.wishlists.create(product_id: @product.id)
  end


  end

  private
  def product_params
    params.permit(:product_id)
  end

  def new_params
    params.permit(:name)
  end


end
