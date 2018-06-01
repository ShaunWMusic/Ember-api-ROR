class ApplicationController < JSONAPI::ResourceController
  def authenticate
    begin
        authenticate_or_request_with_http_token do |token, options|
            verified_token = JWT.decode token, JWT_SECRET, true, { algorithm: "HS512" }

          user_id = verified_token[0]["sub"]

          @current_user = User.find(user_id)
        end
      rescue
        render status: :unauthorized, json: {
          errors: [
            {
              status: 401,
              title: "Unauthorized"
            }
          ]
        }
    end
  end
end
