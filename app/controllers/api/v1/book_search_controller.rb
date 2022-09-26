class Api::V1::BookSearchController < ApplicationController

  def index
    location = params[:location]
    quantity = params[:quantity]

    books = BookFacade.get_books(location, quantity)

    forecast = BookForecastFacade.get_forecast(location)

    render json: BookSerializer.book_search(books, forecast, location)
  end

end
