require 'spec_helper'

describe Bilbot::App do
  it 'should return foo' do
    get '/'
    last_response.should be_ok
  end

  it 'should create a new customer' do
    Bilbot::Customer.should_receive(:new).with('token', 'secret', 'list').once
    post '/create', {
      oauth_token: 'token',
      oauth_token_secret: 'secret',
      target_list: 'list',
    }
  end
end
