module Bilbot
  class Queue
    attr_accessor :queue, :coll

    def initialize(customer = nil)
      @queue = [
        'queue', customer ? customer.id : nil
      ]
       .compact
       .join("-")

      @coll = Bilbot.mongo.collection('queue')
    end

    def enqueue(var)
      # Put one message onto the queue
      @coll.insert(queue: @queue, payload: var)
    end

    def dequeue
      # Get First message from the queue
      col =  @coll.find_and_modify({ query: { queue: @queue } , sort: { _id: 1 }, remove: true })
      !(col.nil? || col == 0) ? col['payload'] : false
    end

    def clean
      @coll.remove(queue: @queue)
    end
  end
end
