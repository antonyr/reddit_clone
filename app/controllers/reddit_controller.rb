require 'reddit_presenter'

class RedditController < ApplicationController

  before_filter :authenticate

  def index
    per_page = Kaminari.config.instance_eval('@_config')[:default_per_page]
    page = params[:page] ||= 1
    range = calculate_range_for_page(page.to_i, per_page)
    @articles = RedditPresenter.new(RedditResource.top(per_page * NUMBER_OF_PAGES )).articles.slice(range)
    Kaminari.paginate_array(@articles).page(page.to_i).per(per_page)

    add_methods_to_array(@articles, page.to_i)
  end

  def calculate_range_for_page(page_num, per_page)
    per_page * (page_num - 1)..(page_num * per_page) - 1
  end

  # This method is particularly needed for Kaminari for paginating array.
  def add_methods_to_array(articles, page)
    articles.instance_eval %Q(
      def current_page
        #{page || 1}
      end
      def limit_value
        15
      end
      def total_pages
        3
      end)
  end
end