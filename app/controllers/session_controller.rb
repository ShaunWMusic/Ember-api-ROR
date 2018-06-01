require 'jwt'

class SessionController < ApplicationController
  def create
    email = params["email"]
    password = params["password"]

    begin
      user = User.find_by!(email: email)

      if BCrypt::Password.new(user.password_digest) == password
      data = {id: user.id, username: user.username, email: user.email}
      payload = {data: data, sub: user.id, exp: Time.now.to_i + 2 * 3600}

      token = JWT.encode payload, JWT_SECRET, "HS512"


      render json: {token: token}
      else
        render :status => :unauthorized, json: {
          errors: [
            {
              status: 401,
              title: "Unauthorized",
              detail: "Error logging in user with that email and password."
            }
          ]
        }
      end
    rescue
      BCrypt::Password.create(password)
      
      render :status => :unauthorized, json: {
        errors: [
          {
            status: 401,
            title: "Unauthorized",
            detail: "Error logging in user with that email and password."
          }
        ]
      }
    end
  end
end
