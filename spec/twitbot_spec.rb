require 'spec_helper'

describe Twitbot do
  before :each do
    stub_const('ENV', {
      'CONSUMER_KEY'    => 'foo',
      'CONSUMER_SECRET' => 'bar',
      'ACCESS_TOKEN'    => 'fiz',
      'ACCESS_SECRET'   => 'fuz'
    })
  end

  describe '#rest_client' do
    it 'should add env values to populate consumer token' do
      Twitbot.rest_client = nil
      Twitbot.rest_client.consumer_key.should == 'foo'
      Twitbot.rest_client.consumer_secret.should == 'bar'
    end

<<<<<<< HEAD
    it 'should render a client object' do
      Twitbot.rest_client.class.should == Twitter::REST::Client
    end


    it 'should memorize the client' do
=======
    it 'should memoize the client' do
>>>>>>> b1f1b09260470045b054fd69ae77f284fa835445
      Twitbot.rest_client.should == Twitbot.rest_client
    end
  end

  describe '#streaming_client' do
    it 'should render a streaming client object' do
      Twitbot.streaming_client.class.should == Twitter::Streaming::Client
    end

    it 'should memoize the client' do
      Twitbot.streaming_client.should == Twitbot.streaming_client
    end
  end

  describe '#redis' do
    it 'should memoize the client', :vcr do
      Twitbot.redis.should == Twitbot.redis
    end
  end
end
