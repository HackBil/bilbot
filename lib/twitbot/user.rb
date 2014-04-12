module Twitbot
  class User < SimpleDelegator
    attr_accessor :user

    def initialize(id = nil)
      @user = Twitbot.rest_client.user(id)
      super(@user)
    end

    def follow(id = nil)
      Twitbot.rest_client.follow(id)
    end

    def followers(id = nil)
      Twitbot.rest_client.followers(id)
    end

    def followings(id = nil)
      Twitbot.rest_client.friends(id)
    end
    
  end
end