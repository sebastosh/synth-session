class AuthController < ApplicationController
  def login
      user = User.find_by(username: params[:username])
      is_authenticated = user.authenticate(params[:password])

      if is_authenticated
          # payload = { user_id: user.id }

          # token = JWT.encode payload, 'fortytwo', 'HS256'

          # render json: {token: encode_token(payload)}
          render json: { token: encode_token(user_payload(user)) }
      else

      render json: {errors: "WRONG"}
      end
  end
end
