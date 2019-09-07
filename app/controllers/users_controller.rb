class UsersController < ApplicationController
    def index
        users = User.all
        render json: UserSerializer.new(users)
      end

    def show
        user = User.find(params[:id])
        render json: UserSerializer.new(user)
      end

      def create
        user = User.create(user_params)
        if user.valid?
            render json: { token: encode_token(user_payload(user)) }
        else
            render json: {errors: user.errors.full_messages}
        end

    end

     # PATCH/PUT /users/1
  def update
    if user.update(user_params)
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    user.destroy
  end

    def profile
        render json: current_user
    end

    private

    def user_params
        params.permit(:username, :password)
    end
end
