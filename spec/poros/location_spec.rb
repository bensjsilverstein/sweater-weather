require 'rails_helper'

RSpec.describe Location do

  it 'exists and has readable attributes', :vcr do
    location = MapquestService.get_coords('denver,co')
    coords = Location.new(location)
    expect(coords.lat).to eq(39.738453)
    expect(coords.long).to eq(-104.984853)
  end
end
