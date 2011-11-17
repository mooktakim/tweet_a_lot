require 'spec_helper'

describe ExpandUrl do
  it "should expand bitly to restlessbeings.org" do
    result = ExpandUrl.expand "http://bit.ly/kfPxmD"
    result.should == "http://www.restlessbeings.org/"
  end

  it "should return same url if not a shortened url" do
    result = ExpandUrl.expand "http://www.restlessbeings.org/"
    result.should == "http://www.restlessbeings.org/"
  end
end