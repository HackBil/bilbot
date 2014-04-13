module Bilbot
  class Kate
  	attr_accessor :coll

    def initialize(queue)
		@queue = queue    
    	@coll = Bilbot.mongo['customers']
    end

    def take_customer
      Bilbot::Customer.findall.each do |customer|
      	a_secret = customer['a_secret']
      	a_token = customer['a_token']
      	target_list = customer['target_list']      
	  end

    end

    def perform

    end


  end
end