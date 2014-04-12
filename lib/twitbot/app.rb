require 'sinatra'

module Twitbot
  class App < Sinatra::Base
    get '/' do
      'foo'
    end
  end
end
