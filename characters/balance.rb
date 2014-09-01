#!/usr/bin/env/ruby
require 'nokogiri'

# Reports on skill build costs for Weird Characters in the
# Atomic Robo RPG

xml    = File.read(ARGV.first)
doc    = Nokogiri::XML(xml)
modes  = doc.xpath('//mode')
totals = modes.map do |mode|
  skills = mode.xpath('skill')
  costs  = skills.map { |sk| sk.attribute('cost').to_s.to_i }
  adds   = skills.map { |sk| sk.attribute('add').to_s.to_i }
  total  = [costs, adds].flatten.inject(0, &:+)
  puts "#{mode.attribute('name')} costs #{total}"
  total
end

puts "#{30 - totals.inject(0, &:+)} pts remaining"
