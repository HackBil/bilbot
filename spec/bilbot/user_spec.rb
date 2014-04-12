require 'spec_helper'

describe Bilbot::User do
  let(:object) { NullObject.new }

  it "should forward methods to the delegated user" do
    Bilbot.rest_client.stub(:user) { object }
    object.should_receive(:foo).once
    Bilbot::User.new.foo
  end

  describe "#recent_followers" do
    let(:user) { Bilbot::User.new }

    it "should return the full set of followers if never fetched yet", :vcr do
      expect(user.recent_followers.to_a).to eq(user.followers.to_a)
    end
  end
end
