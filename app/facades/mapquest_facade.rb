class MapquestFacade

  def self.get_coords(location)
    result = MapquestService.get_coords(location)
    Location.new(result)
  end

  def self.get_route(start = '', final = '')
    route_info = MapquestService.get_route(start, final)

    RoadTrip.new(route_info)
  end

end
