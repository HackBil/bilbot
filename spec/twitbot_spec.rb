require 'spec_helper'

describe Twitbot do

  describe '#rest_client' do
    it 'should render a client object' do
      Twitbot.rest_client.class.should == Twitter::REST::Client
    end

    it 'should add env values to populate consumer token' do
      Twitbot.rest_client.consumer_key.should == 'foo'
      Twitbot.rest_client.consumer_secret.should == 'bar'
    end

    it 'should memorize the client' do
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
    it 'should memoize the client' do
      Twitbot.redis.should == Twitbot.redis
    end
  end
end