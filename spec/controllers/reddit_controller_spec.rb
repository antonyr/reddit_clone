require 'spec_helper'

describe RedditController, :type => :controller do
  render_views

  before(:each) do
    user_name = 'test'
    password = 'test'
    User.create(:user_name => user_name, :password => password)
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user_name, password)
  end

  it 'should show index page' do
    stubbed_objects = [{'data' => {'title' => 'hello world', 'author' => 'janet', 'created_utc' => 1351240823.0, 'url' => 'imgur.com/anc'}},
                       {'data' => {'title' => 'my world', 'author' => 'james', 'created_utc' => 1351245823.0, 'url' => 'imgur.com/abc'}}]
    RedditResource.should_receive(:top).with(45).and_return(stubbed_objects)
    get :index
    assert_select '.container' do
      assert_select 'p a', 'hello world'
      assert_select 'p a', 'my world'
    end

    assert_select 'p.grey-small' do
      assert_select 'a', 'janet'
      assert_select 'a', 'james'
    end

    assert_select 'div.span7' do
      assert_select 'a[href=?]', 'imgur.com/anc'
      assert_select 'a[href=?]', 'imgur.com/abc'
      assert_select 'p', '26 October 2012, 02:10 PM'
      assert_select 'p', '26 October 2012, 03:33 PM'
    end
  end

  it 'should show only 15 articles for page 1' do
    @controller.index
    15.should == @controller.instance_eval('@articles').size
  end

  it 'should calculate range for page 1' do
    (0..14).should eq(@controller.calculate_range_for_page(1, 15))
  end

  it 'should calculate range for page 2' do
    (15..29).should eq(@controller.calculate_range_for_page(2, 15))
  end

  it 'should calculate range for page 2' do
    (30..44).should eq(@controller.calculate_range_for_page(3, 15))
  end
end
