require 'rails_helper'

RSpec.describe DailyWeather do
  it 'exists and has attributes' do

            data = {"dt": 1664128800,
            "sunrise": 1664110223,
            "sunset": 1664153565,
            "moonrise": 1664108760,
            "moonset": 1664154360,
            "moon_phase": 0,
            "temp": {
                "day": 70.79,
                "min": 56.43,
                "max": 76.3,
                "night": 56.43,
                "eve": 74.08,
                "morn": 58.6
            },
            "feels_like": {
                "day": 68.56,
                "night": 54.12,
                "eve": 72.14,
                "morn": 55.67
            },
            "pressure": 1022,
            "humidity": 21,
            "dew_point": 29.01,
            "wind_speed": 9.06,
            "wind_deg": 7,
            "wind_gust": 12.03,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": 4,
            "pop": 0,
            "uvi": 6.46}

    weather_poro = DailyWeather.new(data)

   expect(weather_poro).to be_a DailyWeather
   expect(weather_poro.dt).to eq("09/25/2022")
   expect(weather_poro.sunr).to eq("06:50:23 AM")
   expect(weather_poro.suns).to eq("06:52:45 PM")
   expect(weather_poro.max_temp).to eq(76.3)
   expect(weather_poro.min_temp).to eq(56.43)
   expect(weather_poro.cond).to eq("Clear")
   expect(weather_poro.icon).to eq("01d")
 end
end
