class SessionsController < ApplicationController
    def index
        sessions = Session.all
        render json: SessionSerializer.new(sessions)
      end

    def show
        session = Session.find(params[:id])
        render json: SessionSerializer.new(session)
      end
end
