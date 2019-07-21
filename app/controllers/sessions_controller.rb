class SessionsController < ApplicationController
    def index
        sessions = Session.all
        render json: SessionSerializer.new(sessions)
      end

    def show
        session = Session.find(params[:id])
        render json: SessionSerializer.new(session)
    end

    def create
      session = Session.create(session_params)
      render json: session
  end

  def session_params
      params.require(:session).permit!
    end
end
