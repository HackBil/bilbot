require 'spec_helper'

describe Twitbot::User do
  it "should forward methods to the delegated user" do
    object = NullObject.new
    Twitbot.rest_client.stub(:user) { object }
    object.should_receive(:foo).once
    Twitbot::User.new.foo
  end
end
