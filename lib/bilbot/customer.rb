module Bilbot
  class Customer
    attr_accessor :a_token
    attr_accessor :a_secret

    attr_accessor :target_list

    def initialize(_a_token, _a_secret, _target_list = [])
      @a_secret = _a_secret
      @a_token = _a_token
      @target_list = _target_list
    end

    def self.coll
      @coll ||= Bilbot.mongo['customers']
    end

    def save
      self.class.coll.update(
        { a_secret: @a_secret, a_token: @a_token},
        { a_secret: @a_secret, a_token: @a_token, target_list: @target_list },
        { :upsert => true }
      )
    end

    # To be Used by API
    def self.create (_a_token, _a_secret, _target_list = [])
      out = self.new(_a_token, _a_secret, _target_list = [])
      out.save
    end

    def self.findall
      coll.find.map{ |customer| Customer.new(customer['a_token'], customer['a_secret'], customer['target_list'])}
    end

    def rest_client
      @rest_client ||= Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV["CONSUMER_KEY"]
        config.consumer_secret     = ENV["CONSUMER_SECRET"]
        config.access_token        = @a_token
        config.access_token_secret = @a_secret
      end
    end
  end
end
