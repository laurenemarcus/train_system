require('rspec')
require('pg')
require('line')

DB = PG.connect({:dbname => 'train_system_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM lines *;")
  end
end

describe(Line) do

  describe(".all") do
    it("is empty at first") do
      expect(Line.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a line by its ID number") do
      test_line = Line.new({ :line_name => "Blue Line", :id => nil })
      test_line.save()
      test_line2 = Line.new({ :line_name => "Green Line", :id => nil })
      test_line2.save()
      expect(Line.find(test_line2.id())).to(eq(test_line2))
    end
  end

  describe("#save") do
    it("pushes the line object into the lines array") do
      test_line = Line.new({ :line_name => "Blue Line", :id => nil })
      test_line.save()
      expect(Line.all()).to(eq([test_line]))
    end
  end

  describe("#line_name") do
    it("tells you its line_name") do
      line = Line.new({:line_name => "Blue Line", :id => nil})
      expect(line.line_name()).to(eq("Blue Line"))
    end
  end

  describe("id") do
    it("sets its ID when you save it") do
      line = Line.new({:line_name => "Blue Line", :id => nil})
      line.save()
      expect(line.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#==") do
    it("is the same line if it has the same name") do
      line1 = Line.new({:line_name => "Blue Line", :id => nil})
      line2 = Line.new({:line_name => "Blue Line", :id => nil})
      expect(line1).to(eq(line2))
    end
  end

  describe('#stations') do
    it("returns the station array for the line") do
    test_line = Line.new({ :line_name => "Blue Line", :id => 3})
    test_line.save()
    test_station = Station.new({ :station_name => "Downtown", :station_location => "SW 5th Ave", :id => 4})
    test_station.save()
    test_station2 = Station.new({ :station_name => "Lloyd Center", :station_location => "NE 10th", :id => 5})
    test_station2.save()
    expect(test_line.stations()).to(eq([test_station, test_station2]))
    end
  end
end
