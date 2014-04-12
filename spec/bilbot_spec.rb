require 'spec_helper'

describe Bilbot do
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
      Bilbot.rest_client = nil
      Bilbot.rest_client.consumer_key.should == 'foo'
      Bilbot.rest_client.consumer_secret.should == 'bar'
    end

    it 'should render a client object' do
      Bilbot.rest_client.class.should == Twitter::REST::Client
    end


    it 'should memoize the client' do
      Bilbot.rest_client.should == Bilbot.rest_client
    end
  end

  describe '#streaming_client' do
    it 'should render a streaming client object' do
      Bilbot.streaming_client.class.should == Twitter::Streaming::Client
    end

    it 'should memoize the client' do
      Bilbot.streaming_client.should == Bilbot.streaming_client
    end
  end

  describe '#redis' do
    it 'should memoize the client', :vcr do
      Bilbot.redis.should == Bilbot.redis
    end
  end
end
