class ImportTax < Tax
  DESCRIPTION_KEYWORDS = %w(imported)
  class << self
    def applies_to?(line_item)
      DESCRIPTION_KEYWORDS.each do |keyword|
        return true if line_item.description.include?(keyword)
      end
      false
    end
    
    def on(line_item)
      return 0 if !applies_to?(line_item)
      return line_item.price * 0.05
    end
  end
end
