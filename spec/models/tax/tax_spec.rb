require 'spec_helper'

describe Tax do  
  context '#round_up_to_nearest_nickel' do
    it "should round up" do
      Tax.send(:round_up_to_nearest_nickel, 10.00).should eq(10.0)
      Tax.send(:round_up_to_nearest_nickel, 11.25).should eq(11.25)
      Tax.send(:round_up_to_nearest_nickel, 0.56).should eq(0.6)
      Tax.send(:round_up_to_nearest_nickel, 0.52).should eq(0.55)
    end
    # edge case, spec is a little unclear here, documenting expected behavior 
    it "should consider the thousandths place" do
      Tax.send(:round_up_to_nearest_nickel, 0.561).should eq(0.6)
      Tax.send(:round_up_to_nearest_nickel, 0.551).should eq(0.6)
      Tax.send(:round_up_to_nearest_nickel, 0.001).should eq(0.05)
    end
  end

end