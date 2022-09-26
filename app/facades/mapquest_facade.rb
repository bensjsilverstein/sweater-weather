class MapquestFacade

  def self.get_coords(location)
    result = MapquestService.get_coords(location)
    Location.new(result)
  end

end
