class Api::V1::ForecastController < ApplicationController
    def index
      if !params[:location].present? || params[:location].nil?
        render json: { error: 'missing location' }, status: 404
      else
        location = MapquestFacade.get_coords(forecast_params)
        weather = WeatherFacade.create_forecast(location)
        render json: ForecastSerializer.new(weather)
      end
    end

    private

    def forecast_params
        params.permit(:location)
    end
end
