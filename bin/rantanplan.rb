#!/usr/bin/ruby

$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'bilbot'

rantanplan = Bilbot::Rantanplan.new

while true
  rantanplan.perform
  sleep(864)
end
