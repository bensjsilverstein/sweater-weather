require 'rails_helper'

RSpec.describe CurrentWeather do
  it 'exists and has attributes' , :vcr do
    lat_long = MapquestFacade.get_coords("denver,co")
    weather = WeatherFacade.get_current_weather(lat_long)

    expect(weather).to be_an_instance_of(CurrentWeather)
    expect(weather.dt).to be_a(String)
    expect(weather.sunr).to be_a(String)
    expect(weather.suns).to be_a(String)
    expect(weather.temp).to be_a(Float)
    expect(weather.feels).to be_a(Float)
    expect(weather.hum).to be_an(Integer)
    expect(weather.uvi).to be_a(Float)
    expect(weather.vis).to be_an(Integer)
    expect(weather.cond).to be_a(String)
    expect(weather.icon).to be_a(String)
  end
end
