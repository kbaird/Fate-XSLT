#!/usr/bin/env ruby
# pyramid.rb

def cost_of(dist)
  cost  = 0
  accum = ->(count, idx) { cost += count * idx }
  dist.each_with_index(&accum)
  cost
end

def count_of(dist)
  dist.inject(0, &:+)
end

skills_for = {
  deep:   [0, 5, 3, 2, 2],
  medium: [0, 5, 5, 2, 1],
  broad:  [0, 7, 4, 2, 1],
  smooth: [0, 5, 4, 3, 2, 1]
}

puts
skills_for.each do |label,dist|
  puts "cost  of #{label} = #{cost_of(dist)}"
  puts "count of #{label} = #{count_of(dist)}"
  puts
end

