class BlogStory < ActiveRecord::Base

  def thumb_url
    "#{image_url}&h=100&crop=1"
  end
end
