class ApplicationController < ActionController::API

    before_action :authenticate
    before_filter :cors_set_access_control_headers
    after_filter :cors_set_access_control_headers

    def cors_set_access_control_headers
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
        headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
        headers['Access-Control-Request-Method'] = '*'
    end
      

    def authenticate
        header = request.headers["Authorization"]

        if !header
            render json: {error: "no token present"}, status: :unauthorized
        else
            begin
                token = header.split(" ")[1]
                secret = Rails.application.secret_key_base
                payload = JWT.decode(token, secret)[0]
                
                @user = User.find payload["user_id"]
            rescue
                render json: {error: "Bad token"}, status: :unauthorized
            end
        end
    end
end
