require 'spec_helper'

describe "should test reddit presenter" do
  it "should create list of articles" do
    title = 'hello world'
    janet = 'janet'
    thumbnail = 'x'
    imgur = 'imgur.com'
    stubbed_objects = [{'data' => {'title' => title, 'thumbnail' => thumbnail, 'author' => janet, 'created_utc' => 1351240823.0, 'url' => imgur}},
        {'data' => {'title' => 'my world', 'author' => 'james', 'created_utc' => 1351245823.0}}]
    articles = RedditPresenter.new(stubbed_objects).articles
    2.should eq(articles.size)
    title.should eq(articles.first.title)
    janet.should eq(articles.first.author)
    thumbnail.should eq(articles.first.thumbnail)
    imgur.should eq(articles.first.url)
  end
end
