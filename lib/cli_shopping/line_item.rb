class LineItem
  attr_accessor :count, :description, :price
  def initialize(cli_input)
    m = /(?<count>\d+)\s+(?<description>.*)(\s+)(at)/.match(cli_input)
    if m
      @count = m[:count].to_i
      @description = m[:description]
    end
  end
end
