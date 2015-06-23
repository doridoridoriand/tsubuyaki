class BotAccount < ActiveRecord::Base
  def api_client
    @api_client = Twitter::REST::Client.new do |config|
      config.consumer_key        = consumer_key
      config.consumer_secret     = consumer_secret
      config.access_token        = access_token
      config.access_token_secret = access_token_secret
    end
  end

  def late_limit
    api_client.__send__(:perform_get, '/1.1/application/rate_limit_status.json')
  end

  def friend_ids
    api_client.friend_ids.to_a
  end

  def follower_ids
    api_client.follower_ids.to_a
  end
end
