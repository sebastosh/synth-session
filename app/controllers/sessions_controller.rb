class SessionsController < ApplicationController
    def index
        sessions = Session.all
        render json: SessionSerializer.new(sessions)
      end

    def show
        session = Session.find(params[:id])
        render json: OrgSerializer.new(session)
      end
end
