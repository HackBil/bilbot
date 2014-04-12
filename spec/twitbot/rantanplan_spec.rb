require 'spec_helper'

describe Twitbot do
  it "should take the first item in the list and follow it", :vcr do
    user = Twitbot::User.new
    list = Array.new
    tobware = 'tobware'
    tarte_au_sucre = 'tarte_au_sucre'
    list.push(tobware)
    list.push(tarte_au_sucre)
    rantanplan = Twitbot::Rantanplan.new(user, list)
    rantanplan.action
    list.length.should == 1
    user.followings.include?(tobware).should == false
    user.followings.include?(tarte_au_sucre).should == true
    rantanplan.action
    list.length.should == 0
    user.followings.include?(tobware).should == true
    user.followings.include?(tarte_au_sucre).should == true
  end
end
