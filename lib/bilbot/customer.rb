module Bilbot
  class Customer

    attr_accessor :a_token
    attr_accessor :a_secret

    attr_accessor :target_list

    attr_accessor :coll

    def initialize(a_token, a_secret, target_list)
    	@a_secret = a_secret
    	@a_token = a_token

    	@target_list = target_list

    	@coll =  Bilbot.mongo['customers']

    	out = @coll.update(
            { a_secret: 'a_secret', a_token: 'a_token'},
            { a_secret: 'a_secret', a_token: 'a_token', target_list: 'target_list'},
            { :upsert => true }
        )
    end

    def findall
    	@coll.find
    end
   end
end 