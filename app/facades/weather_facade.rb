class WeatherFacade

  def self.get_current_weather(coords)
    parsed = WeatherService.get_weather(coords)
    CurrentWeather.new(parsed[:current])
  end
  # def self.current(location)
  #       parsed_json = WeatherService.get_weather(location)
  #       CurrentWeather.new(parsed_json[:current])
  #   end

  def self.get_daily_weather(coords)
    parsed = WeatherService.get_weather(coords)
    parsed[:daily].map do |weather|
      DailyWeather.new(weather)
    end
  end

  def self.get_hourly_weather(coords)
    parsed = WeatherService.get_weather(coords)
    parsed[:hourly].map do |weather|
      HourlyWeather.new(weather)
    end
  end

  def self.create_forecast(location)
    location = MapquestFacade.get_coords(location)
    weather = WeatherService.get_weather(location)

    Forecast.create_forecast(weather)
  end

  # def self.forecast(coords)
  #   current =  WeatherService.get_weather(coords)
  #
  #   daily = WeatherService.get_weather(coords)
  #   parsed[:daily].take(5).map do |weather|
  #     DailyWeather.new(weather)
  #   end
  #
  #   hourly = WeatherService.get_weather(coords)
  #   parsed[:hourly][0..7].map do |weather|
  #     HourlyWeather.new(weather)
  #   end
  # end


end
