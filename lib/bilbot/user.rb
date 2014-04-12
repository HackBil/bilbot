module Bilbot
  class User < SimpleDelegator
    attr_accessor :user

    def initialize(id = nil)
      @user = Bilbot.rest_client.user(id)
      super(@user)
    end

    def follow(id)
      Bilbot.rest_client.follow(id)
    end

    def unfollow(id)
      Bilbot.rest_client.unfollow(id)
    end

    def followers(id = nil)
      Bilbot.rest_client.followers(id || @user.id)
    end

    def followings(id = nil)
      Bilbot.rest_client.friends(id || @user.id)
    end
    
    def get_last_follower
        Bilbot.redis.get(@user.id)
    end

    def set_last_follower(id = nil)
        Bilbot.redis.set(@user.id,id)
    end

  end
end
