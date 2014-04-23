require 'spec_helper'

describe Bilbot::Rantanplan do
  let(:user) { Bilbot::User.new }
  let(:rantanplan) { Bilbot::Rantanplan.new(user, queue) }

  describe '#follow!' do
    context 'the queue is empty' do
      let(:queue) { double(dequeue: false) }

      it 'shouldn\'t hit the follow method and return false', :vcr do
        Bilbot::User.any_instance.should_not_receive(:follow)
        rantanplan.follow!.should == false
      end
    end

    context 'the queue is not empty' do
      let(:queue) { double(dequeue: 'tarte_au_sucre') }

      it 'should hit the follow method and return a user', :vcr do
        Bilbot::User.any_instance.should_receive(:follow).with('tarte_au_sucre')
        rantanplan.follow!.should == 'tarte_au_sucre'
      end
    end

    describe "grab_stats" do
      let(:queue) { nil }

      before :each do
        Bilbot.mongo['bbStat'].remove
      end

      it 'should add the stats into the mongo db (id, follower and friends count and new follower', :vcr do
        user.stub(:id) { 'foo' }
        user.stub(:followers_count) { 1 }
        user.stub(:friends_count) { 2 }
        rantanplan.grab_stats('bar')
        u = Bilbot.mongo['bbStat'].find.first
        u.delete('_id')
        u.should == { 'user' => 'foo', 'followerCount' => 1, 'followingCount' => 2, 'newFollower' => 'bar' }
      end
    end
  end
end
