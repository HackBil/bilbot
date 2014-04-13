require 'spec_helper'

describe Bilbot::Queue do
  let(:queue) { Bilbot::Queue.new }
  let(:mongodb) { Bilbot.mongo.collection('queue') }

  before :each do
  	queue.clean
  end

  it "should flush a Queue" do
  	mongodb.insert( { queue: 'queue', payload:  'var' } )
  	queue.clean
  	mongodb.find( { queue: 'queue'} ).count.should == 0
  end

  it "should enqueue an Object to Queue" do
  	queue.enqueue 'test'
  	mongodb.find( { queue: 'queue'} ).count.should == 1
  end

  it "should dequeue an Object from Queue" do
  	queue.enqueue 'test'
  	queue.dequeue.should == 'test'
:a

  end

  it "should return false when dequeue last Object" do
  	queue.enqueue 'test'
  	queue.dequeue
  	queue.dequeue.should be_false
  end

end
