module Twitbot
  class Queue < SimpleDelegator
    def initialize()
    	# @redis_client = Redis.New(url:'redis://redistogo:dfecc27c174f80919e08b2e41ee5f5f2@grideye.redistogo.com:10595/')
    	super(Twitbot.redis)
    end

    def enqueue(var)
    	Twitbot.redis.rpush('mylist',var)
    end

    def dequeue(block = false)
    	if block
    		Twitbot.redis.blpop()
    	else
    		Twitbot.redis.lpop()
    	end
    end
  end
end