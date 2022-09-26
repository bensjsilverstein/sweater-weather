class DailyWeather
  attr_reader :dt, :sunr, :suns, :max_temp, :min_temp, :cond, :icon
  def initialize(data)
    @dt = Time.at(data[:dt]).strftime("%m/%d/%Y")
    @sunr = Time.at(data[:sunrise]).strftime("%I:%M:%S %p")
    @suns = Time.at(data[:sunset]).strftime("%I:%M:%S %p")
    @max_temp = data[:temp][:max].to_f
    @min_temp = data[:temp][:min].to_f
    @cond = data[:weather][0][:main]
    @icon = data[:weather][0][:icon]
  end
end
