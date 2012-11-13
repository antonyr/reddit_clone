class RedditResource < ActiveResource::Base
  self.site = 'http://www.reddit.com'
  self.format = :json
  self.element_name = ''

  def self.top(number)
    get(:hot, :limit => number)['data']['children']
  end

end
