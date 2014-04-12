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
        
        col =  coll.find_and_modify({ query: { queue: @queue } , sort: { _id: +1 }, remove: true })

        unless col.nil? || col == 0
            return col["payload"]
        else
            return false
        end
    end
  end
end 