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
      instrument = Instrument.find_by(id: params[:id])
      instrument.update(instrument_params)
      render json: instrument
    end
 
    def destroy
      instrument = Instrument.find_by(id: params[:id])
      instrument.destroy
    end
 
 
    private
    def instrument_params
      params.require(:instrument).permit!
    end
end
