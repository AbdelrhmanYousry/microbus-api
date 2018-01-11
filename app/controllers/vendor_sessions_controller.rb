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
          user: {user_id: vendor.id, user_name: vendor.name, user_email: vendor.email, user_type: 'vendor', user_balance: vendor.current_balance}
        }
      end
end
