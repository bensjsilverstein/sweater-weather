
class RoadTripSerializer
  def self.create_roadtrip(start, final)
    final_coords = MapquestFacade.get_coords(final)
    roadtrip = MapquestFacade.get_route(start, final)
    weather_hourly = WeatherFacade.get_hourly_weather(final_coords)
    weather_daily = WeatherFacade.get_daily_weather(final_coords)
    if roadtrip.time && roadtrip.hours < 48
      {
        data: {
          id: nil,
          type: 'roadtrip',
          attributes: {
            start_city: roadtrip.start,
            end_city: roadtrip.final,
            travel_time: roadtrip.travel_time,
            weather_at_eta: {
              temperature: weather_hourly[roadtrip.hours].temp,
              conditions: weather_hourly[roadtrip.hours].cond
            }
          }
        }
      }
    elsif roadtrip.time
      day = roadtrip.hrs / 24
      {
        data: {
          id: nil,
          type: 'roadtrip',
          attributes: {
            start_city: roadtrip.start,
            end_city: roadtrip.final,
            travel_time: roadtrip.travel_time,
            weather_at_eta: {
              temperature: weather_daily[day].max_temp,
              conditions: weather_daily[day].cond
            }
          }
        }
      }
    else
      {
        data: {
          id: nil,
          type: 'roadtrip',
          attributes: {
            start_city: roadtrip.start,
            end_city: roadtrip.final,
            travel_time: 'impossible route'
          }
        }
      }
    end
  end
end
