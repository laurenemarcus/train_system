require('rspec')
require('pg')
require('station')

DB = PG.connect({:dbname => 'train_system_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stations *;")
  end
end

describe(Station) do

  describe(".all") do
    it("is empty at first") do
      expect(Station.all()).to(eq([]))
    end
  end

  describe("#station_name") do
    it("tells you its station name") do
      test_station = Station.new({:station_name => "Downtown", :station_location => "SW 5th Ave", :id => nil})
      expect(test_station.station_name()).to(eq("Downtown"))
    end
  end

  describe("#station_location") do
    it("tells you its station location") do
      test_station = Station.new({:station_name => "Downtown", :station_location => "SW 5th Ave", :id => nil})
      expect(test_station.station_location()).to(eq("SW 5th Ave"))
    end
  end

  describe("#save") do
    it("adds a station to the array of saved stations") do
      test_station = Station.new({:station_name => "Downtown", :station_location => "SW 5th Ave", :id => nil})
      test_station.save()
      expect(Station.all()).to(eq([test_station]))
    end
  end

  describe("#==") do
    it("is the same station if it has the same station name") do
      test_station = Station.new({:station_name => "Downtown", :station_location => "SW 5th Ave", :id => nil})
      test_station2 = Station.new({:station_name => "Downtown", :station_location => "SW 5th Ave", :id => nil})
      expect(test_station).to(eq(test_station2))
    end
  end
end
