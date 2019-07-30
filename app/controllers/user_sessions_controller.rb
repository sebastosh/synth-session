class UserSessionsController < ApplicationController
  before_action :set_user_session, only: [:show, :update, :destroy]

  # GET /user_sessions
  def index
    user_sessions = UserSession.all

    render json: UserSessionSerializer.new(user_sessions)
  end

  # GET /user_sessions/1
  def show
    user_session = UserSession.find(params[:id])
    render json: UserSessionSerializer.new(user_session)
  end

  # POST /user_sessions
  def create
    user_session = UserSession.new(user_session_params)

    if user_session.save
      render json: user_session, status: :created, location: user_session
    else
      render json: user_session.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_sessions/1
  def update
    if user_session.update(user_session_params)
      render json: user_session
    else
      render json: user_session.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_sessions/1
  def destroy
    user_session.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_session
      user_session = UserSession.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_session_params
      params.require(:user_session).permit(:name, :session_id, :user_id)
    end
end
