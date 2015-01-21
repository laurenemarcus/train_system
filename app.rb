require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/line")
require("./lib/station")
require("pg")

DB = PG.connect({:dbname => "train_system"})

get("/") do
  @lines = Line.all()
  erb(:index)
end

post("/lines") do
  line_name = params.fetch("line_name")
  line = Line.new({:line_name => line_name, :id => nil})
  line.save()
  @lines = Line.all()
  erb(:index)
end

get("/lines/:id") do
  @line = Line.find(params.fetch("id").to_i())
  erb(:line)
end

post("/stations") do
  station_name = params.fetch("station_name")
  station_location = params.fetch("station_location")
  id = params.fetch("id").to_i()
  station = Station.new({:station_name => station_name, :station_location => station_location, :id => id})
  station.save()
  @line = Line.find(id)
  erb(:line)
end
