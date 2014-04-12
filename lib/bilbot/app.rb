require 'sinatra'

module Bilbot
  class App < Sinatra::Base
    get '/' do
      'foo'
    end
  end
end
