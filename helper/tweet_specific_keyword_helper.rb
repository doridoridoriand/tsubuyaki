#$: << File.expand_path(File.join(__FILE__, '..', '..', 'lib'))
#require 'favrica_sns'

module TweetSpecificKeywordHelper
  def generate_tweet_content
    data = []
    self.each do |entry|
      data << "#{entry['title']}#{entry['description']}#{entry['favrica_url']}"
    end
    data
  end
end
