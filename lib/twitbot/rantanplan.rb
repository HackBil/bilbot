module Twitbot
  class Rantanplan
    def initialize(u, l)
      @user = u
      @list = l
    end

    def action
      if @list.length > 0
        u = @list.pop
        @user.follow(u)
      end
     end

  end
end
