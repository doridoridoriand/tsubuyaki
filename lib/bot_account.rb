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
end
