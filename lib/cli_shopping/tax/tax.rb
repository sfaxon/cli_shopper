class Tax
  class << self
    def on(line_item)
      0.0
    end
    def applies_to?(line_item)
      return false
    end
  end
end
