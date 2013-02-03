require 'spec_helper'

describe Checkout do
  
  context '#receipt_items' do
    before(:each) do
      @cart = ShoppingCart.new
      ["1 book at 12.49",
      "1 music CD at 14.99",
      "1 chocolate bar at 0.85"].each do |desc|
        @cart.add(LineItem.new(desc))
      end
    end
    it 'should have line items tax and total' do
      c = Checkout.new(@cart)
      c.receipt_items.size.should eq(5)
    end
  end
  
end
