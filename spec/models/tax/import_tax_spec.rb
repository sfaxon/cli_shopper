require 'spec_helper'

describe ImportTax do

  context '#applies_to?' do
    it "should return true when item description contains imported" do
      line_item = LineItem.new("1 imported box of chocolates at 10.00")
      ImportTax.applies_to?(line_item).should eq(true)
    end
    it "should return false when item does not contain any description keywords" do
      line_item = LineItem.new("1 book at 10.00")
      ImportTax.applies_to?(line_item).should eq(false)
    end
  end
  
  context '#on' do
    it "should return round tax amount" do
      line_item = LineItem.new("1 box of imported chocolates at 11.25")
      ImportTax.on(line_item).should eq(0.6)
    end
    it "should return correct tax amount" do
      line_item = LineItem.new("1 imported box of chocolates at 10.00")
      ImportTax.on(line_item).should eq(0.5)
    end
  end

end
