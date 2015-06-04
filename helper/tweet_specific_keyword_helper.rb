module TweetSpecificKeywordHelper
  def generate_tweet_content
    data = []
    self.each do |entry|
      data << "【#{entry['title']}】#{entry['description']}#{entry['favrica_url']}"
    end
    data
  end

  def generate_tweet_content_with_direct_link
    data = []
    self.each do |entry|
      data << "【#{entry['title']}】#{entry['description']}#{entry['stocks'][0]['item_url']}"
    end
    data
  end
end
