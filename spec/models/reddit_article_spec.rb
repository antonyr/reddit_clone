require 'spec_helper'

describe 'This should test reddit article' do
  it "should print time in appropriate format" do
    article = {'data' => {'title' => 'hello world', 'author' => 'janet', 'created_utc' => 1340537400.0}}
    '24 June 2012, 05:00 PM'.should eq(RedditArticle.new(article).published_time)
  end
end