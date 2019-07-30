class SessionInstrumentsController < ApplicationController
  before_action :set_session_instrument, only: [:show, :update, :destroy]

  # GET /session_instruments
  def index
    session_instruments = SessionInstrument.all

    render json: SessionInstrumentSerializer.new(session_instruments)
  end

  # GET /session_instruments/1
  def show
    session_instrument = SessionInstrument.find(params[:id])
    
    render json: SessionInstrumentSerializer.new(session_instrument)
  end

  # POST /session_instruments
  def create
    session_instrument = SessionInstrument.new(session_instrument_params)

    if session_instrument.save
      render json: session_instrument, status: :created, location: session_instrument
    else
      render json: session_instrument.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /session_instruments/1
  def update
    if session_instrument.update(session_instrument_params)
      render json: session_instrument
    else
      render json: session_instrument.errors, status: :unprocessable_entity
    end
  end

  # DELETE /session_instruments/1
  def destroy
    session_instrument.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session_instrument
      session_instrument = SessionInstrument.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def session_instrument_params
      params.require(:session_instrument).permit(:name, :session_id, :instrument_id)
    end
end
