require 'spec_helper'

describe ShoppingCart, "#count" do
  it "returns 0 for new cart" do
    cart = ShoppingCart.new
    cart.count.should eq(0)
  end
end

