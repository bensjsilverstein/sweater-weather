class RoadTrip
  attr_reader :start, :final, :time, :hours, :travel_time

  def initialize(data)
    if data[:route][:locations]
      destination_begin = data[:route][:locations].first
      @start = "#{destination_begin[:adminArea5]}, #{destination_begin[:adminArea3]}"
      destination_end = data[:route][:locations].last
      @final = "#{destination_end[:adminArea5]}, #{destination_end[:adminArea3]}"
    end
    @time = data[:route][:time]
    @hours = time.to_i / 3600 #time is in seconds - divide by 3600 to get hours
    @mins = (time.to_i / 60) % 60 #use modulo to return remainder in minutes
    @travel_time = "#{@hours} hours, #{@mins} minutes" if time
  end
end
