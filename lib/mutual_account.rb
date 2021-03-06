class MutualAccount < ActiveRecord::Base
  class << self
    def find_randomly
      self.all.sample
    end
  end

  def api_client
    @api_client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = consumer_key
      config.consumer_secret     = consumer_secret
      config.access_token        = access_token
      config.access_token_secret = access_token_secret
    end
  end
end
