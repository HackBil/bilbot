$:.unshift(File.dirname(__FILE__) + '/lib')
require 'twitbot'

run Twitbot::App
