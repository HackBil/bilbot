module Bilbot
  class Rantanplan
    def initialize(user, queue)
      @user, @queue = user, queue
      @coll = Bilbot.mongo['bbStat']
    end

    def grab_stats(target)
      @coll.insert({
        user: @user.id,
        followerCount: @user.followers_count,
        followingCount: @user.friends_count,
        newFollower:target,
      })
    end

    def follow!
      target = @queue.dequeue
      if target
        @user.follow(target)
      end
      target
    end

    def perform
      target = follow!
      grab_stats(target)
    end
  end
end
