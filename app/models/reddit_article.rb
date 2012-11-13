class RedditArticle
  def initialize(article_hash)
    @article = article_hash
  end

  %w{thumbnail title created_utc author url name}.each do |method_name|
    define_method(method_name) do
      @article['data'][method_name]
    end
  end

  def published_time
    Time.at(created_utc).strftime('%d %B %Y, %I:%M %p')
  end
end