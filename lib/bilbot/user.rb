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

    def recent_followers
      unless last_follower = get_last_follower
        return followers
      end

      result = []
      followers.each do |f|
        break if f.id == last_follower
        result << f
      end
      result
    end

    def followings(id = nil)
      Bilbot.rest_client.friends(id || @user.id)
    end

    def get_last_follower
      coll = Bilbot.mongo.collection('users')
      out = coll.find( { 'user' => @user.id } ).first
      unless out.nil? || out == 0
        return out["follower_id"]
      else
        return false
      end
    end

    def set_last_follower(id = nil)
      coll = Bilbot.mongo.collection('users')
      out = coll.update(
            { 'user' => @user.id },
            { "follower_id" => id, 'user' => @user.id  },
            { :upsert => true }
          )
      return out
    end

  end
end
