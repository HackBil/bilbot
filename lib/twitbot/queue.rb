module Twitbot
  class Queue < SimpleDelegator
  	attr_accessor :queue
  

    def initialize(twitbot_user)
    	# @redis_client = Redis.New(url:'redis://redistogo:dfecc27c174f80919e08b2e41ee5f5f2@grideye.redistogo.com:10595/')
    	@queue =  'queue-' + twitbot_user.id
    	super(Twitbot.redis)
    end

    def enqueue(var)
    	# Put one message onto the queue
    	Twitbot.redis.rpush(@queue,var)
    end

    def dequeue(block = false)
    	# Get First message from the queue
    	if block
    		Twitbot.redis.blpop(@queue)
    	else
    		Twitbot.redis.lpop(@queue)
    	end
    end
    
  end
end