class BookForecastFacade

  def self.get_forecast(location)
    coords = MapquestFacade.get_coords(location)
    forecast = WeatherFacade.get_current_weather(coords)
  end

end
