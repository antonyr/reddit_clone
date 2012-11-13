require 'spec_helper'

describe 'should test reddit_helper' do
  it 'should not display thumbnail when thumbnail is crap' do
    ''.should eq(RedditHelper.show_if_image('crap'))
  end

  it 'should display thumbnail when image is jpg' do
    image_link = 'http://imgur.com/abc.jpg'
    image_link.should eq(RedditHelper.show_if_image(image_link))
  end

  it 'should view icon when url is jpg' do
    image_link = 'http://imgur.com/abc.jpg'
    true.should eq(RedditHelper.image_view?(image_link))
  end

  it 'should view icon when url is jpg' do
    image_link = 'http://imgur.com/abc.png'
    true.should eq(RedditHelper.image_view?(image_link))
  end

  it 'should not view icon when url is text' do
    image_link = 'http://imgur.com/abc.txt'
    false.should eq(RedditHelper.image_view?(image_link))
  end
end