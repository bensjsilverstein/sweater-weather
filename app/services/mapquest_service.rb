class MapquestService
  def self.get_coords(location)
    response = conn.get('/geocoding/v1/address') do |route|
      route.params['location'] = location
    end
    parse_json(response)
  end

  private
  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com') do |faraday|
      faraday.params['key'] = ENV.fetch('map_api_key', nil)
    end
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
