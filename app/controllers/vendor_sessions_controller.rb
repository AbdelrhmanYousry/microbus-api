class VendorSessionsController < ApplicationController
    def login
        vendor = Vendor.find_by(email: params[:email])

            if vendor && vendor.authenticate(params[:password])
              render json: response_obj(vendor), status: :ok
              # render json: {message: 'login successful' } , status: :ok
            else
              render json: {error: 'Invalid username / password'}, status: :unauthorized
            end
    end

          private
      def response_obj(vendor)
        {
          auth_token: JsonWebToken.encode({vendor_id: vendor.id}),
          vendor: {vendor_id: vendor.id, vendor_name: vendor.name, vendor_email: vendor.email}
        }
      end
end
