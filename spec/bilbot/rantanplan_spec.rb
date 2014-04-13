require 'spec_helper'

describe Bilbot do
  let(:user) { Bilbot::User.new }
  let(:rantanplan) { Bilbot::Rantanplan.new(user, queue) }

  describe '#follow!' do
    context 'the queue is empty' do
      let(:queue) { double(dequeue: false) }

      it 'shouldn\'t hit the follow method', :vcr do
        Bilbot::User.any_instance.should_not_receive(:follow)
        rantanplan.follow!
      end
    end

    context 'the queue is not empty' do
      let(:queue) { double(dequeue: 'tarte_au_sucre') }

      it 'should hit the follow method', :vcr do
        Bilbot::User.any_instance.should_receive(:follow).with('tarte_au_sucre')
        rantanplan.follow!
      end
    end

    describe "grab_stats" do
      let(:queue) { nil }

      before :each do
        Bilbot.mongo['bbStat'].remove
      end

      it 'should add the stats into the mongo db', :vcr do
        user.stub(:id) { 'foo' }
        user.stub(:followers_count) { 1 }
        user.stub(:friends_count) { 2 }
        rantanplan.grab_stats
        u = Bilbot.mongo['bbStat'].find.first
        u.delete('_id')
        u.should == { 'user' => 'foo', 'followerCount' => 1, 'followingCount' => 2 }
      end
    end
  end
end
