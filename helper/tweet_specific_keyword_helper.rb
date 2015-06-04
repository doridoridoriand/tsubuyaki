$: << File.expand_path(File.join(__FILE__, '..', '..', 'lib'))
require 'favrica_sns'

module TweetSpecificKeywordHelper
  def generate_tweet_content
    data = []
    self.each do |entry|
      data << "【#{entry['title']}】#{truncate_description(entry['description'])} #{entry['favrica_url']}"
    end
    data
  end

  def generate_tweet_content_with_direct_link
    data = []
    self.each do |entry|
      data << "【#{entry['title']}】#{entry['description']} #{entry['stocks'][0]['item_url']}"
    end
    data
  end

  private

  def truncate_description(string)
    string[FavricaSns::DESCRIPTION_TRUNCATE[0]..FavricaSns::DESCRIPTION_TRUNCATE[1]]
  end
end
