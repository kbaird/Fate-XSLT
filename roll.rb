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

DESCRIPTIONS = {

  # https://twitter.com/lumpleygames/status/403556521579384832
  jastenave: %w(environment instinct training equipment),

  # http://thealexandrian.net/wordpress/2793/roleplaying-games/dice-of-destiny-part-2-qualities
  destiny: [
    'time required',
    'outside influences',
# 'knowledge',
    'skill',
#'luck',
    'style',
#'power',
#'finesse',
  ]
}

def format(results)
  results.inject({}) do |h,pair|
    head, tail = *pair
    new_pair   = {head => tail}
    h.merge(new_pair)
  end
end

def roll(set)
  get_results = ->(memo,desc) { memo.merge(desc => roll_die) }
  results     = DESCRIPTIONS[set].inject({}, &get_results)
  total       = results.map(&:last).inject(:+)
  [total, format(results)]
end

def roll_die
  rand(-1..1)
end

set = ARGV[0] || :destiny
puts roll(set.to_sym)
