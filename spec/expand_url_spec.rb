require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "TweetALot::ExpandUrl" do

  it "should expand bitly to restlessbeings.org" do
    result = TweetALot::ExpandUrl.expand "http://bit.ly/kfPxmD"
    result.should == "http://www.restlessbeings.org/"
  end

  it "should return same url if not a shortened url" do
    result = TweetALot::ExpandUrl.expand "http://www.restlessbeings.org/"
    result.should == "http://www.restlessbeings.org/"
  end

end