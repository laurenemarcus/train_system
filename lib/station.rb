class Station

  @@stations = []

  attr_reader(:station_name, :station_location, :id)

  define_method(:initialize) do |attributes|
    @station_name = attributes.fetch(:station_name)
    @station_location = attributes.fetch(:station_location)
    @id = attributes[:id]
  end

  define_singleton_method(:all) do
    returned_stations = DB.exec("SELECT * FROM stations;")
    stations = []
    returned_stations.each() do |station|
      station_name = station.fetch("station_name")
      station_location = station.fetch("station_location")
      id = station.fetch("id").to_i()
      stations.push(Station.new({:station_name => station_name, :station_location => station_location, :id => id }))
    end
    stations
  end

  define_method(:==) do |another_station|
    self.station_name().==(another_station.station_name()).&(self.id().==(another_station.id()))
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stations (station_name, station_location) VALUES ('#{@station_name}', '#{@station_location}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
    @@stations.push()
  end
end
