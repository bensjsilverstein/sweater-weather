class HourlyWeather
  attr_reader :date, :dt, :temp, :cond, :icon
  def initialize(data)
    @date = Time.at(data[:dt]).to_s
    @dt = Time.at(data[:dt]).strftime("%H:%M:%S")
    @temp = data[:temp]
    @cond = data[:weather][0][:main]
    @icon = data[:weather][0][:icon]
  end
end
