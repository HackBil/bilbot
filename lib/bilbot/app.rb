require 'sinatra'

module Bilbot
  class App < Sinatra::Base
    get '/' do
      'foo'
    end

    post '/create' do
      token = params[:oauth_token]
      secret = params[:oauth_token_secret]
      targetList = params[:target_list]
      puts token
      targetList.each do |target|
        puts target
      end
      Customer.new(token, secret, targetList)
    end
  end
end
