class Api::V1::ForecastController < ApplicationController
    def index
        location = MapquestFacade.get_coords(forecast_params)
        weather = WeatherFacade.create_forecast(location)
        render json: ForecastSerializer.new(weather)
      end

    private

    def forecast_params
        params.permit(:location)
    end
end
