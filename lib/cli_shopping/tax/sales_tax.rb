class SalesTax < Tax
  # book, food and medical are expmpt
  EXEMPTION_KEYWORDS = %w(pills book chocolate)
  TAX_RATE = 0.1
  class << self
    def applies_to?(line_item)
      EXEMPTION_KEYWORDS.each do |keyword|
        return false if line_item.description.include?(keyword)
      end
      true
    end
    
    def on(line_item)
      return 0 if !applies_to?(line_item)
      calculate_rounded_tax(line_item.price, TAX_RATE)
    end
  end
end
