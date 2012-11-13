class User < ActiveRecord::Base
  attr_accessible :password, :user_name

  def self.valid?(user_name, password)
    User.exists?(:user_name => user_name, :password => password)
  end
end
