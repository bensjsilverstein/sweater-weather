class WeatherService
  def self.get_weather(coords)
    response = conn.get('onecall') do |route|
      route.params['lat'] = coords.lat
      route.params['lon'] = coords.long
      route.params['exclude'] = 'minutely,alerts'
      route.params['units'] = 'imperial'
    end
    parse_json(response)
  end

  def self.conn
    Faraday.new(url: "https://api.openweathermap.org/data/2.5/") do |faraday|
      faraday.params['appid'] = ENV.fetch('weather_key', nil)
    end
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
