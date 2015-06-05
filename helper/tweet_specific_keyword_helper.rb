$: << File.expand_path(File.join(__FILE__, '..', '..', 'lib'))
require 'favrica_sns'

module TweetSpecificKeywordHelper
  def generate_tweet_content
    data = []
    self.each do |entry|
      data << "【#{entry['title']}】#{truncate_description(entry['description'])} #{entry.generate_link_randomly}"
    end
    data
  end

  def generate_tweet_content_with_direct_link
    data = []
    self.each do |entry|
      data << "【#{entry['title']}】#{truncate_description(entry['description'])} #{entry['stocks'][0]['item_url']}"
    end
    data
  end

  private

  def truncate_description(string)
    string[FavricaSns::DESCRIPTION_TRUNCATE[0]..FavricaSns::DESCRIPTION_TRUNCATE[1]]
  end

  def generate_link_randomly
    rand = Random.new
    if (rand(1..100) <= 25)
      item_link = self['favrica_url']
    else
      item_link = self['stocks'][0]['item_url']
    end
    item_link
  end
end
