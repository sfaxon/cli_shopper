class Checkout
  
  def initialize(shopping_cart)
    @shopping_cart = shopping_cart
  end
  
  # return an array for easy testing
  def receipt_items
    returning = []
    sales_tax = 0.0
    total = 0.0
    @shopping_cart.each do |line_item|
      sales_tax = sales_tax + line_item.tax
      total = total + line_item.price_with_tax
      returning << "#{line_item.count} #{line_item.description}: #{line_item.price_with_tax}"
    end
    returning << "Sales Taxes: #{sales_tax}"
    returning << "Total: #{total}"
  end
  
  def print_receipt
    puts receipt_items.join("\n")
  end

end