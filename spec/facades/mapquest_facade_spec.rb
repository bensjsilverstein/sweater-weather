require 'rails_helper'

RSpec.describe MapquestFacade do

  it 'returns a Location poro', :vcr do
    location = MapquestFacade.get_coords('denver,co')

    expect(location).to be_a(Location)
  end

  it "returns a route", :vcr do
    route = MapquestFacade.get_route('Denver, CO', 'Orland, FL')

    expect(route).to be_a RoadTrip
  end

end
