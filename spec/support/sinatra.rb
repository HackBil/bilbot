require 'rack/test'

module SinatraSpec
  include Rack::Test::Methods

  def app
    Bilbot::App
  end
end
