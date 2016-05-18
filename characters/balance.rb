#!/usr/bin/env/ruby
require 'nokogiri'

# Reports on skill build costs for Weird Characters in the
# Atomic Robo RPG

def extract(attr)
  ->(sk) { sk.attribute(attr).to_s.to_i }
end

totals = 0
ARGV.each do |filename|
  xml      = File.read(filename)
  doc      = Nokogiri::XML(xml)
  modes    = doc.xpath('//mode')
  modes.each do |mode|
    skills = mode.xpath('skill')
    costs  = skills.map &(extract('cost'))
    adds   = skills.map &(extract('add'))
    total  = [costs, adds].flatten.inject(0, &:+)
    puts "#{mode.attribute('name')} costs #{total}"
    totals += total
  end
end

puts "#{30 - totals} pts remaining"
