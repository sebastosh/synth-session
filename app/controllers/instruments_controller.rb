class InstrumentsController < ApplicationController
    def index
        instruments = Instrument.all
        render json: InstrumentSerializer.new(instruments)
      end

    def show
        instrument = Instrument.find(params[:id])
        render json: InstrumentSerializer.new(instrument)
      end

      def create
        instrument = Instrument.create(instrument_params)
        render json: instrument
    end

    def update
      instrument = Instrument.update(instrument_params)
      render json: instrument
  end
  
    def instrument_params
        params.require(:instrument).permit!
      end
end
