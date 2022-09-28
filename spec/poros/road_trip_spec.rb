require 'rails_helper'

RSpec.describe RoadTrip do

  it 'exists and has readable attributes', :vcr do
    route_info = MapquestService.get_route('Denver, CO', 'Orlando, FL')
    route = RoadTrip.new(route_info)
    expect(route.start).to eq('Denver, CO')
    expect(route.final).to eq('Orlando, FL')
    expect(route.hours).to eq(26)
    expect(route.travel_time).to eq("26 hours, 48 minutes")
  end
end
