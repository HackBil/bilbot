#!/usr/bin/ruby

require 'bilbot'

u = Bilbot::Queue.new

u.enqueue('test')
u.dequeue()