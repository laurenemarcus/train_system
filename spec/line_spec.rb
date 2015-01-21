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

  describe("#save") do
    it("pushes the line object into the lines array") do
      test_line = Line.new({ :line_name => "Blue Line", :line_color => "Blue", :line_id => nil })
      test_line.save()
      expect(Line.all()).to(eq([test_line]))
    end
  end

  describe("#line_name") do
    it("tells you its line_name") do
      line = Line.new({:line_name => "Blue Line", :line_color => "Blue", :line_id => nil})
      expect(line.line_name()).to(eq("Blue Line"))
    end
  end

  describe("#line_color") do
    it("tells you its line_color") do
      line = Line.new({:line_name => "Blue Line", :line_color => "Blue", :line_id => nil})
      expect(line.line_color()).to(eq("Blue"))
    end
  end

  describe("line_id") do
    it("sets its ID when you save it") do
      line = Line.new({:line_name => "Blue Line", :line_color => "Blue", :line_id => nil})
      line.save()
      expect(line.line_id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#==") do
    it("is the same line if it has the same name") do
      line1 = Line.new({:line_name => "Blue Line", :line_color => "Blue", :line_id => nil})
      line2 = Line.new({:line_name => "Blue Line", :line_color => "Blue", :line_id => nil})
      expect(line1).to(eq(line2))
    end
  end
end
