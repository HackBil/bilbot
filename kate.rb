#!/usr/bin/ruby

$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'bilbot'

kate = Bilbot::Kate.new(Bilbot::Queue.new)

while true
  kate.perform
  sleep(10)
end
