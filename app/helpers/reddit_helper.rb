
module RedditHelper
  def show_if_image(thumbnail_link)
    return thumbnail_link if thumbnail_link =~ /\w+.(jpg|png)/
    ''
  end

  def image_view?(url)
    (url =~ /\w+.(jpg|png)/).present?
  end

  module_function :show_if_image, :image_view?
end