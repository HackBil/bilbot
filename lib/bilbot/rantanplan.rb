module Bilbot
  class Rantanplan
    def initialize(u, l)
      @user = u
      @list = l
      db = Bilbot::mongo
      @coll =db['bbStat'];
    end

    def action
      if @list.length > 0
        u = @list.pop
        @user.follow(u)
      end
      obj = {
        "user" => @user.screen_name,
        "followerCount" => @user.followers_count,
        "followingCount" => @user.friends_count,
      }
      @coll.insert(obj)
     end

  end
end
