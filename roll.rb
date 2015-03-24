#!/usr/bin/env ruby
# roll.rb

# descriptive die rolls for FUDGE/Fate, as per an idea developed
# by Vincent Baker for his Jastenave game.
# cf. https://twitter.com/lumpleygames/status/403556521579384832
#
# Also appeared later (and surely independently) in Pyramid Vol2
# "Dice of Destiny" by Justin Bacon
# http://www.sjgames.com/pyramid/sample.html?id=1686
# http://thealexandrian.net/wordpress/2781/roleplaying-games/dice-of-destiny

class Roll

  DESCRIPTIONS = {

    # https://twitter.com/lumpleygames/status/403556521579384832
    jastenave: %w(environment instinct training equipment),

    # http://thealexandrian.net/wordpress/2793/roleplaying-games/dice-of-destiny-part-2-qualities
    destiny: [ 'time required', 'outside influences', 'skill', 'style' ]
    # 'knowledge', 'luck', 'power', 'finesse',

  }

  def initialize(set)
    get_results = ->(memo,desc) { memo.merge(desc => dF) }
    @results_h  = DESCRIPTIONS[set].inject({}, &get_results)
    @total      = @results_h.map(&:last).inject(:+)
  end

  def results
    [@total, format(@results_h)]
  end

  private

  def dF
    rand(-1..1)
  end

  def format(results_h)
    results_h.inject({}) do |h,pair|
      head, tail = *pair
      new_pair   = {head => tail}
      h.merge(new_pair)
    end
  end

end

set = ARGV[0] || :destiny
puts Roll.new(set.to_sym).results
