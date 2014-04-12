require 'spec_helper'

describe Bilbot do
  it "should take the first item in the list and follow it", :vcr do
    user = Bilbot::User.new
    list = Array.new
    tobware = 'tobware'
    tarte_au_sucre = 'tarte_au_sucre'
    list.push(tobware)
    list.push(tarte_au_sucre)
    list.each do |id|
      user.unfollow(id)
    end
    rantanplan = Bilbot::Rantanplan.new(user, list)

    list.length.should == 2
    user.followings.include?(tobware).should == false
    user.followings.include?(tarte_au_sucre).should == false
   
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
