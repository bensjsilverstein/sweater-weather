require 'rails_helper'

RSpec.describe 'Mapquest Service' do
  it 'gets latitude and longitude from a location', :vcr do
    response = MapquestService.get_coords("denver,co")
    expect(response).to be_a Hash
    expect(response[:results]).to be_an Array

    data = response[:results].first
    expect(data[:locations][0][:latLng]).to be_a Hash
    expect(data[:locations][0][:latLng][:lat]).to be_a Float
    expect(data[:locations][0][:latLng][:lng]).to be_a Float
  end

  it 'generates a route from start point to end point', :vcr do
   start = "Denver, CO"
   final = "Santa Cruz, CA"
   route = MapquestService.get_route(start, final)

   expect(route).to have_key(:route)
   expect(route[:route]).to have_key(:distance)
   expect(route[:route]).to have_key(:formattedTime)
  end
end
