module Twitbot
  class User < SimpleDelegator
    attr_accessor :user

    def initialize(id = nil)
      @user = Twitbot.rest_client.user(id)
      super(@user)
    end

    def follow(id)
      Twitbot.rest_client.follow(id)
    end

    def unfollow(id)
      Twitbot.rest_client.unfollow(id)
    end

    def followers(id = nil)
      Twitbot.rest_client.followers(id || @user.id)
    end

    def followings(id = nil)
      Twitbot.rest_client.friends(id || @user.id)
    end
    
    def get_last_follower
        Twitbot.redis.get(@user.id)
    end

    def set_last_follower(id = nil)
        Twitbot.redis.set(@user.id,id)
    end

  end
end
