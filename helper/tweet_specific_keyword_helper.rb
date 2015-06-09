$: << File.expand_path(File.join(__FILE__, '..', '..', 'lib'))
require 'favrica_sns'

module TweetSpecificKeywordHelper
  def generate_tweet_content
    hash = Hash.new {|h, e| h[e] = {}}
    self.each_with_index do |entry, i|
      hash[i][:tweet_string] = "【#{entry['title']}】#{truncate_description(entry['description'])} #{entry['favrica_url']}"
      hash[i][:image] = entry['images'].map {|image| image['large_url']}.to_a
    end
    hash
  end

  def generate_tweet_content_with_direct_link
    hash = Hash.new {|h, e| h[e] = {}}
    self.each_with_index do |entry, i|
      hash[i][:tweet_string] = "【#{entry['title']}】#{truncate_description(entry['description'])} #{entry['stocks'][0]['item_url']}"
      hash[i][:image] = entry['images'].map {|image| image['large_url']}.to_a
    end
    hash
  end

  private

  def truncate_description(string)
    string[FavricaSns::DESCRIPTION_TRUNCATE[0]..FavricaSns::DESCRIPTION_TRUNCATE[1]]
  end
end
