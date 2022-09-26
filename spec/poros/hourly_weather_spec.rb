require 'rails_helper'

RSpec.describe HourlyWeather do
  it 'exists and has attributes' do

            data =
            {"dt": 1664168400,
            "temp": 56.43,
            "feels_like": 54.12,
            "pressure": 1021,
            "humidity": 50,
            "dew_point": 38.05,
            "uvi": 0,
            "clouds": 44,
            "visibility": 10000,
            "wind_speed": 3.11,
            "wind_deg": 31,
            "wind_gust": 5.3,
            "weather": [
                {
                    "id": 802,
                    "main": "Clouds",
                    "description": "scattered clouds",
                    "icon": "03n"
                }
            ],
            "pop": 0}

    weather_poro = HourlyWeather.new(data)

   expect(weather_poro).to be_a HourlyWeather
   expect(weather_poro.date).to eq("2022-09-25 23:00:00 -0600")
   expect(weather_poro.dt).to eq("23:00:00")
   expect(weather_poro.temp).to eq(56.43)
   expect(weather_poro.cond).to eq("Clouds")
   expect(weather_poro.icon).to eq("03n")
 end
end
