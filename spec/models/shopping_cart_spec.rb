require 'spec_helper'

describe ShoppingCart do
  context '#count' do
    it "returns 0 for new cart" do
      cart = ShoppingCart.new
      cart.count.should eq(0)
    end
  end
  context '#empty?' do
    it "returns true when empty" do
      cart = ShoppingCart.new
      cart.should be_empty
    end
    it "retuns true when stuff is in the cart" do
      cart = ShoppingCart.new
      cart.add(1)
      cart.should_not be_empty
    end
  end
  context '#add should increase #count' do
    it "retuns true when stuff is in the cart" do
      cart = ShoppingCart.new
      cart.add("foobar")
      cart.count.should eq(1)
    end
  end
end
