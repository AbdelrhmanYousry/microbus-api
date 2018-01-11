class VendorRegistrationsController < ApplicationController
    def create
        vendor = Vendor.new(vendor_params)

        if vendor.save
          render json: {status: 'vendor created successfully'}, status: :created
        else
          render json: { errors: vendor.errors.full_messages }, status: :bad_request
        end
      end

    private

    def vendor_params
      params.require(:vendor).permit(:name, :email, :password, :password_confirmation)
    end
end
