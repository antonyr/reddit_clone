
class RedditPresenter
  def initialize(articles)
    @reddit_articles = []
    articles.each do |article|
      @reddit_articles << RedditArticle.new(article)
    end
  end

  def articles
    @reddit_articles
  end
end