#!/usr/bin/env ruby
# roll.rb

# descriptive die rolls for FUDGE/FATE, as per an idea developed
# by Vincent Baker for his Jastenave game.
# cf. https://twitter.com/lumpleygames/status/403556521579384832
#
# Also appeared later (and surely independently) in Pyramid Vol2
# "Dice of Destiny" by Justin Bacon
# http://www.sjgames.com/pyramid/sample.html?id=1686
# http://thealexandrian.net/wordpress/2781/roleplaying-games/dice-of-destiny

#DESCRIPTIONS = %w(environment instinct training equipment)
DESCRIPTIONS = [
  'time required',
  'outside influences',
  'skill',
  'style'
]

def format(results)
  results.inject({}) do |h,pair|
    head, tail = *pair
    tail = tail < 1 ? tail.to_s : "-#{tail}"
    new_pair   = {head => tail}
    h.merge(new_pair)
  end
end

def roll
  get_results = ->(memo,desc) { memo.merge(desc => roll_die) }
  results = DESCRIPTIONS.inject({}, &get_results)
  total   = results.map(&:last).inject(:+)
  [total, format(results)]
end

def roll_die
  rand(-1..1)
end

puts roll
