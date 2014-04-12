$:.unshift(File.dirname(__FILE__) + '/lib')
require 'bilbot'

run Bilbot::App
