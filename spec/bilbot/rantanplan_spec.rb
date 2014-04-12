require 'spec_helper'

describe Bilbot do
  it "should take the first item in the list and follow it", :vcr do
    user = Bilbot::User.new
    list = Array.new
    tobware = 'tobware'
    tarte_au_sucre = 'tarte_au_sucre'
    list.push(tobware)
    list.push(tarte_au_sucre)
    followingList = user.followings
    list.each do |id|
      if followingList.include?(id)
        user.unfollow(id)
      end
    end
    rantanplan = Bilbot::Rantanplan.new(user, list)

    list.length.should == 2
    followingList = user.followings
    followingList.include?(tobware).should == false
    followingList.include?(tarte_au_sucre).should == false

    rantanplan.action
    list.length.should == 1

    followingList = user.followings
    followingList.include?(tobware).should == false
    followingList.include?(tarte_au_sucre).should == true

    rantanplan.action

    list.length.should == 0
    followingList = user.followings
    followingList.include?(tobware).should == true
    followingList.include?(tarte_au_sucre).should == true
  end
end
