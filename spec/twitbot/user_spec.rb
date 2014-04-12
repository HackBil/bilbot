require 'spec_helper'

describe Twitbot::User do
  let(:object) { NullObject.new }

  it "should forward methods to the delegated user" do
    Twitbot.rest_client.stub(:user) { object }
    object.should_receive(:foo).once
    Twitbot::User.new.foo
  end
end