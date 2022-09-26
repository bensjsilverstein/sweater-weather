class Api::V1::ForecastController < ApplicationController
  def index
    location = params[:location]
    quantity = params[:quantity]
    forecast = BookForecastFacade.get_book_destination_forecast(location)
    render json: BookSerializer.book_search_response(books, forecast, city)
  end
end
