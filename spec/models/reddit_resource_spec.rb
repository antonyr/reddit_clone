require 'spec_helper'

describe "verify reddit resource" do

  it "should fetch top 10 article" do
    top = RedditResource.top(10)
    10.should eq(top.size)
  end

  it "should fetch top 10 article" do
    top = RedditResource.top(10)
    10.should eq(top.size)
  end

end