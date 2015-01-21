class Line

  @@lines = []

  attr_reader(:line_name, :id)

  define_method(:initialize) do |attributes|
    @line_name = attributes.fetch(:line_name)
    @id = attributes[:id]
  end

  define_singleton_method(:all) do
    returned_lines = DB.exec("SELECT * FROM lines;")
    lines = []
    returned_lines.each() do |line|
      line_name = line.fetch("line_name")
      id = line.fetch("id").to_i()
      lines.push(Line.new({:line_name => line_name, :id => id }))
    end
    lines
  end

  define_singleton_method(:find) do |id|
    found_line = nil
    Line.all().each() do |line|
      if line.id().==(id)
        found_line = line
      end
    end
    found_line
  end

  define_method(:stations) do
    list_stations = []
    stations = DB.exec("SELECT * FROM stations WHERE id = #{self.id()};")
    stations.each() do |station|
      station_name = station.fetch("station_name")
      station_location = station.fetch("station_location")
      id = task.fetch("id").to_i()
      list_stations.push(Station.new({ :station_name => station_name, :station_location => station_location, :id => id}))
    end
    list_stations
  end

  define_method(:==) do |another_line|
    self.line_name().==(another_line.line_name()).&(self.id().==(another_line.id()))
  end

  define_method(:save) do
    result = DB.exec( "INSERT INTO lines (line_name) VALUES ('#{@line_name}') RETURNING id;" )
    @id = result.first().fetch("id").to_i()
    @@lines.push()
  end
end
