class ImportTax < Tax
  DESCRIPTION_KEYWORDS = %w(imported)
  TAX_RATE = 0.05
  class << self
    def applies_to?(line_item)
      DESCRIPTION_KEYWORDS.each do |keyword|
        return true if line_item.description.include?(keyword)
      end
      false
    end
    
    # returns float of the rounded tax ImportTax amount on the item
    def on(line_item)
      return 0.0 if !applies_to?(line_item)
      calculate_rounded_tax(line_item.price, TAX_RATE)
    end
  end
end
