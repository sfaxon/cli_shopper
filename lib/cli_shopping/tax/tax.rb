class Tax
  class << self
    def on(line_item)
      0.0
    end
    def applies_to?(line_item)
      return false
    end
    private
    # The rounding rules for sales tax are that for a tax rate of n%,
    # a shelf price of p contains (np/100 rounded up to the nearest 0.05)
    def calculate_rounded_tax(price, percent)
      raw_tax = (price * percent)
      round_up_to_nearest_nickel(raw_tax)
    end

    # TODO: variable names could be better, possible refactor
    def round_up_to_nearest_nickel(value)
      returning = 0

      # shift the decimal right twice, %10 to remove everything greater than the ones place
      # so 1.5612 => 6.12
      hundredths_to_ones = (value*100)%10

      if 0.0 == hundredths_to_ones
        returning = value
      elsif hundredths_to_ones > 5
        returning = ((value*100)+(10-hundredths_to_ones)).to_i / 100.0
      else hundredths_to_ones
        returning = ((value*100)+(5-hundredths_to_ones)).to_i / 100.0
      end
      returning
    end
  end
end
