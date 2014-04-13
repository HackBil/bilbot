#!/usr/bin/ruby

require 'bilbot'

rantanplan = Bilbot::Rantanplan.new(Bilbot::User.new, Bilbot::Queue.new)

while true
  sleep(864)
  rantanplan.perform
end
