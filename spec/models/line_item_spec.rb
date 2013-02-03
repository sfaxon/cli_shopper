require 'spec_helper'

describe LineItem do
  context "#new parsing" do
    context "count" do
      it "should be found at start of line" do
        line_item = LineItem.new("1 book at 12.49")
        line_item.count.should eq(1)
      end
      it "should find multiple digits" do
        line_item = LineItem.new("100 boxes of chocolate at 12.49")
        line_item.count.should eq(100)
      end
    end

    context "description" do
      it "should match single word" do
        line_item = LineItem.new("1 book at 12.49")
        line_item.description.should eq("book")
      end
      it "should match multiple words" do
        line_item = LineItem.new("1 bottle of perfume at 18.99")
        line_item.description.should eq("bottle of perfume")
      end
      it "should transform imported" do
        line_item = LineItem.new("1 box of imported chocolates at 11.25")
        line_item.description.should eq("imported box of chocolates")
      end
    end

    context "price" do
      it "should be found" do
        line_item = LineItem.new("1 book at 12.49")
        line_item.price.should eq(12.49)
      end
      it "should not require decimal for fun" do
        line_item = LineItem.new("1 bottle of perfume at 18")
        line_item.price.should eq(18.0)
      end
    end

    it "should ignore blank characters at the end of the line" do
      line_item = LineItem.new("1 bottle of perfume at 18.98  ")
      line_item.count.should eq(1)
      line_item.description.should eq("bottle of perfume")
      line_item.price.should eq(18.98)
    end
  end
end
