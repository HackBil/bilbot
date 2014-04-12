module Twitbot
  class Queue < SimpleDelegator
    attr_accessor :redis_client
    def initialize()
    	#@redis_client = Redis.New(url:'redis://redistogo:dfecc27c174f80919e08b2e41ee5f5f2@grideye.redistogo.com:10595/')
    	super(Twitbot.redis)
    end
  end
end