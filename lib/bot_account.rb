$: << File.expand_path(File.join(__FILE__, '..', '..', 'lib'))
require 'favrica_sns'
require 'twitter'

class BotAccount < ActiveRecord::Base
  def api_client
    @api_client = Twitter::REST::Client.new do |config|
      config.consumer_key        = consumer_key
      config.consumer_secret     = consumer_secret
      config.access_token        = access_token
      config.access_token_secret = access_token_secret
    end
    @api_client
  end

  def friend_ids
    api_client.friend_ids.to_a
  end

  def follower_ids
    api_client.follower_ids.to_a
  end

  def tweet_content
    hash = Hash.new {|h, e| h[e] = {}}
    json_data.each_with_index do |entry, i|
      hash[i][:tweet_string] = "【#{entry['title']}】#{truncate_description(entry['description'])} #{entry['favrica_url']}"
      hash[i][:image] = entry['images'].map {|image| image['large_url']}.to_a.uniq
      hash[i][:item_keywords] = item_keywords(entry['id'])
    end
    hash
  end

  def hash_tags(source_keyword, item_keywords)
    item_keywords.delete(source_keyword)
    hash_keywords = item_keywords.map {|keyword| keyword = "##{keyword}"}
    if (hash_keywords.count > 1)
      return_array_data = hash_keywords.join(' ')
    else
      return_array_data = hash_keywords[0]
    end
    return_array_data
  end

  private

  def truncate_description(string)
    string[FavricaSns::DESCRIPTION_TRUNCATE[0]..FavricaSns::DESCRIPTION_TRUNCATE[1]] << '…'
  end

  def item_keywords(item_id)
    JSON.parse!(open(URI.encode("#{FavricaSns::FAVRICA_ITEM_ENDPOINT}#{item_id}/keywords")).read).map {|node| node['value']}.to_a
  end
end
