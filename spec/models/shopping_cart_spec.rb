require 'spec_helper'

describe ShoppingCart, "#count" do
  it "returns 0 for new item" do
    cart = ShoppingCart.new
    cart.count.should eq(0)
  end
end

