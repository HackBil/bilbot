require 'twitter'
require 'twitbot/user'
require 'twitbot/queue'
require 'twitbot/app'
require 'redis'

module Twitbot
  class << self
    CONFIGS = Proc.new do |config|
      config.consumer_key        = ENV["CONSUMER_KEY"]
      config.consumer_secret     = ENV["CONSUMER_SECRET"]
      config.access_token        = ENV["ACCESS_TOKEN"]
      config.access_token_secret = ENV["ACCESS_SECRET"]
    end

    def rest_client
      @rest_client ||= Twitter::REST::Client.new(&CONFIGS)
    end

    def streaming_client
      @streaming_client ||= Twitter::Streaming::Client.new(&CONFIGS)
    end

    def redis
      @redis ||= Redis.new(url: ENV["REDIS_URL"])
    end
  end
end
