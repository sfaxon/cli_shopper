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
  end
end
