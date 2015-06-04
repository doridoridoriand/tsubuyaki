$: << File.expand_path(File.join(__FILE__, '..', '..', 'lib'))
require 'favrica_sns'
require 'twitter'

module BotAccountModule
  def api_client
    self.each do |data|
      @api_client = Twitter::REST::Client.new do |config|
        config.consumer_key        = data['consumer_key']
        config.consumer_secret     = data['consumer_secret']
        config.access_token        = data['access_token']
        config.access_token_secret = data['access_token_secret']
      end
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
