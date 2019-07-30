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

  def update
    session = Session.find_by(id: params[:id])
    session.update(session_params)
    render json: session
  end

  def destroy
    session = session.find_by(id: params[:id])
    session.destroy
  end


  private
  def session_params
    params.require(:session).permit!
  end
end
