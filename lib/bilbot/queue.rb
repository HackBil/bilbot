module Bilbot
  class Queue < SimpleDelegator
    attr_accessor :queue
    attr_accessor :coll
  

    def initialize(twitbot_user = nil)
        if (twitbot_user == nil)
            @queue = 'queue'
        else
            @queue ='queue-' + twitbot_user.id
        end

        super(Bilbot.mongo)
    end

    def enqueue(var)
        # Put one message onto the queue
        coll = Bilbot.mongo.collection('queue')
        id = coll.insert( { queue: @queue, payload:  var } )
    end

    def dequeue(block = false)
        # Get First message from the queue
        coll = Bilbot.mongo.collection('queue')
        coll.find_and_modify({ query: { queue: @queue } , sort: { _id: +1 }, remove: true })
    end

  end
end 