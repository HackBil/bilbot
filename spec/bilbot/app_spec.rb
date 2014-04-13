require 'spec_helper'

describe Bilbot::App do
  it 'should return foo' do
    get '/'
    last_response.should be_ok
  end
end
