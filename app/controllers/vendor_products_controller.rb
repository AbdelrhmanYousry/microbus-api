class VendorProductsController < ApplicationController
  before_action :authenticate_vendor_request!

  def index
  @vendor_products = @current_vendor.vendor_products
  end

  def create
  @vendor_product = @current_vendor.vendor_products.new(product_params)
  if @vendor_product.save
  else
  render json: {message: 'duplicate entry'}, status: :unauthorized
  end
end

  def createAndAdd
  @product = Product.new(new_params)

  if @product.save
    @vendor_product = @current_vendor.vendor_products.create(product_id: @product.id)
  end


  end

  def show
    @vendor_product = @current_vendor.vendor_products.find params[:id]
  end


  def destroy
    product = @current_vendor.vendor_products.find params[:id]
    product.destroy

    render json: product
  end

  private
  def product_params
    params.permit(:product_id)
  end
#
  def new_params
    params.permit(:name)
  end

#
# end
end
