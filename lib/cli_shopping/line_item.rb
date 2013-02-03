class LineItem
  attr_accessor :count, :description, :price
  attr_reader :valid
  TAX_CLASSES = [ImportTax, SalesTax]
  def initialize(cli_input)
    @valid = true
    # RegEx to parse the cli input
    # (\s+) eats white space
    m = /(?<count>\d+)\s+(?<description>.*)(\s+)(at)(\s+)(?<price>\d+\.*\d*)(.*)/.match(cli_input)
    if m
      @count = m[:count].to_i
      @description = m[:description]
      @price = m[:price].to_f
    else
      @valid = false
    end
  end

  # returns formatted version of the description
  def description
    return "imported #{@description.gsub('imported ', '')}" if @description.include?("imported ")
    @description
  end
  
  def price_with_tax
    price + tax
    (BigDecimal(price.to_s) + BigDecimal(tax.to_s)).to_f
  end
  
  def tax
    returning = 0.0
    TAX_CLASSES.each do |tax_klass|
      returning = returning + tax_klass.on(self)
    end
    returning
  end
  
  def valid?
    @valid
  end
  
  def inspect
    "#<LineItem: @count: #{@count}, @descritpion: #{@description}, @price: #{@price}"
  end
end
