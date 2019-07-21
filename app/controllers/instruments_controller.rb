class InstrumentsController < ApplicationController
    def index
        instruments = Instrument.all
        render json: InstrumentSerializer.new(instruments)
      end

    def show
        instrument = Instrument.find(params[:id])
        render json: InstrumentSerializer.new(instrument)
      end
end
