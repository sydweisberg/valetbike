module StationsHelper
  def count_available_bikes(station)
    return station.docked_bikes.select{ |bike| bike[:status] == "available" }.count
  end

  def count_rentable_bikes(station)
    return station.docked_bikes.select{ |bike| bike[:status] == "available"}.count
  end
end
