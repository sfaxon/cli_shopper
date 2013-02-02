class LineItem
  attr_accessor :count, :description, :price
  def initialize(cli_input)
    # RegEx to parse the cli input
    # (\s+) eats white space
    m = /(?<count>\d+)\s+(?<description>.*)(\s+)(at)(\s+)(?<price>\d+\.*\d*)/.match(cli_input)
    if m
      @count = m[:count].to_i
      @description = m[:description]
      @price = m[:price].to_f
    end
  end
end
