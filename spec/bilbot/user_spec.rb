require 'spec_helper'

describe Bilbot::User do
  let(:object) { NullObject.new }

  it "should forward methods to the delegated user" do
    Bilbot.rest_client.stub(:user) { object }
    object.should_receive(:foo).once
    Bilbot::User.new.foo
  end
end
