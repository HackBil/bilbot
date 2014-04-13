require 'spec_helper'

describe Bilbot::Customer do
  let(:mongodb) { Bilbot.mongo.collection('customers') }

  	it "should add Customer to DB after instantiation" do
  		Bilbot::Customer.new('test','test2','test3')
  		mongodb.find( {  a_secret: 'test2', a_token: 'test'} ).count.should == 1
  	end

end