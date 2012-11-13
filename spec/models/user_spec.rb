require 'spec_helper'

describe User do
  it 'should verify that user/password combination' do
    User.create(:user_name => 'test', :password => 'test')
    User.valid?('test', 'test').should be true
  end

  it 'should not verify that user/password combination' do
    User.create(:user_name => 'test', :password => 'test1')
    User.valid?('test', 'test').should be false
  end
end
