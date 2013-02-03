require 'spec_helper'

describe SalesTax do
  # Basic sales tax is applicable at a rate of 10% on all goods, except books,
  # food, and medical products that are exempt
  context '#applies_to?' do
    it "should return false when item description contains book" do
      line_item = LineItem.new("1 book at 10.00")
      ImportTax.applies_to?(line_item).should eq(false)
    end
    it "should return false when item description contains chocolate" do
      line_item = LineItem.new("1 book at 10.00")
      ImportTax.applies_to?(line_item).should eq(false)
    end
    it "should return false when item description contains pills" do
      line_item = LineItem.new("1 book at 10.00")
      ImportTax.applies_to?(line_item).should eq(false)
    end
    
    it "should return true when item does not contain any exemption keywords" do
      line_item = LineItem.new("1 unicorn at 10.00")
      ImportTax.applies_to?(line_item).should eq(false)
    end
  end
  
  context '#on' do
    it "should return correct tax amount" do
      line_item = LineItem.new("1 music CD at 14.99")
      SalesTax.on(line_item).should eq(1.5)
    end
  end

end