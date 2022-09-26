class CurrentWeather
  attr_reader :dt, :sunr, :suns, :temp, :feels, :hum, :uvi, :vis, :cond, :icon
  def initialize(data)
    @dt = Time.at(data[:dt]).to_s
    @sunr = Time.at(data[:sunrise]).to_s
    @suns = Time.at(data[:sunset]).to_s
    @temp = data[:temp]
    @feels = data[:feels_like]
    @hum = data[:humidity]
    @uvi = data[:uvi].to_f
    @vis = data[:visibility]
    @cond = data[:weather][0][:main]
    @icon = data[:weather][0][:icon]
  end
end
