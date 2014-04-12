module Bilbot
  class Queue < SimpleDelegator
    attr_accessor :queue
  

    def initialize(twitbot_user)
        @queue =  'queue-' + twitbot_user.id
        super(Bilbot.mongo)
    end

    def enqueue(var)
        # Put one message onto the queue
        Bilbot.mongo.rpush(@queue,var)
    end

    def dequeue(block = false)
        # Get First message from the queue
        if block
            Bilbot.mongo.blpop(@queue)
        else
            Bilbot.mongo.lpop(@queue)
        end
    end

  end
end 