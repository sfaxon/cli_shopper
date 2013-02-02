class LineItem
  attr_accessor :count, :description, :price
  def initialize(cli_input)
    m = /(?<count>\d+)/.match(cli_input)
    if m
      @count = m[:count].to_i
    end
  end
end
