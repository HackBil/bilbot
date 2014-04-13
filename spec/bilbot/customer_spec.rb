require 'spec_helper'

describe Bilbot::Customer do
  let(:mongodb) { Bilbot.mongo.collection('customers') }

  it "should add Customer to DB after call method create" do
    Bilbot::Customer.create('test','test2')
    mongodb.find( {  a_secret: 'test2', a_token: 'test'} ).count.should == 1
  end

  it "should destroy Customer" do
  	Bilbot::Customer.create('test','test2')
  	Bilbot::Customer.destroy('test','test2')
	mongodb.find( {  a_secret: 'test2', a_token: 'test'} ).count.should == 0
  end
end
