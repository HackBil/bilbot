module Bilbot
  class Queue < SimpleDelegator
  	attr_accessor :queue
  

    def initialize(bilbot_user)
    	# @redis_client = Redis.New(url:'redis://redistogo:dfecc27c174f80919e08b2e41ee5f5f2@grideye.redistogo.com:10595/')
    	@queue =  'queue-' + bilbot_user.id
    	super(Bilbot.redis)
    end

    def enqueue(var)
    	# Put one message onto the queue
    	Bilbot.redis.rpush(@queue,var)
    end

    def dequeue(block = false)
    	# Get First message from the queue
    	if block
    		Bilbot.redis.blpop(@queue)
    	else
    		Bilbot.redis.lpop(@queue)
    	end
    end
    
  end
end
