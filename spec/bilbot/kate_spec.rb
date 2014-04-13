require 'spec_helper'

describe Bilbot::Kate do
  let(:kate) { Bilbot::Kate.new('customers') }

  it "should add Customer to DB after instantiation" do

    Bilbot::Kate.create('test','test2')
    mongodb.find( {  a_secret: 'test2', a_token: 'test'} ).count.should == 1

  end
end
