class Line

  @@lines = []

  attr_reader(:line_name, :line_color, :line_id)

  define_method(:initialize) do |attributes|
    @line_name = attributes.fetch(:line_name)
    @line_color = attributes.fetch(:line_color)

    @line_id = attributes.fetch(:line_id)
  end

  define_singleton_method(:all) do
    returned_lines = DB.exec("SELECT * FROM lines;")
    lines = []
    returned_lines.each() do |line|
      line_name = line.fetch("line_name")
      line_color = line.fetch("line_color")
      line_id = line.fetch("line_id").to_i()
      lines.push(Line.new({:line_name => line_name, :line_color => line_color, :line_id => line_id }))
    end
    lines
  end

  define_method(:==) do |another_line|
    self.line_name().==(another_line.line_name()).&(self.line_id().==(another_line.line_id()))
  end

  define_method(:save) do
    result = DB.exec( "INSERT INTO lines (line_name, line_color) VALUES ('#{@line_name}', '#{@line_color}') RETURNING line_id;" )
    @line_id = result.first().fetch("line_id").to_i()
    @@lines.push
  end
end
