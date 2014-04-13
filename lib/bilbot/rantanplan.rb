module Bilbot
  class Rantanplan
    def initialize(user, queue)
      @user, @queue = user, queue
      @coll = Bilbot.mongo['bbStat']
    end

    def grab_stats
      @coll.insert({
        user: @user.screen_name,
        followerCount: @user.followers_count,
        followingCount: @user.friends_count,
      })
    end

    def follow!
      if target = @queue.dequeue
        @user.follow(target)
      end
    end

    def perform
      grab_stats
      follow!
    end
  end
end
