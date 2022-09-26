require 'rails_helper'

RSpec.describe 'weather facade', :vcr do
  it 'returns forecast information for a location when given latitude and longitude' do
    coords = MapquestFacade.get_coords("denver,co")
    weather = WeatherFacade.get_current_weather(coords)
    expect(weather).to be_a(CurrentWeather)
    # expect(weather).to have_key(:current)
    # expect(weather).to have_key(:daily)
    # expect(weather).to have_key(:hourly)
  end
end
