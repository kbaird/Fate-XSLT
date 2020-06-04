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
    jastenave: %w[environment instinct training equipment],

    # http://thealexandrian.net/wordpress/2793/roleplaying-games/dice-of-destiny-part-2-qualities
    destiny: ['time required', 'outside influences', 'skill', 'style']
    # 'knowledge', 'luck', 'power', 'finesse',

  }.freeze

  FORMAT_DF = {
    -1 => "-",
     0 => " ",
     1 => "+"
  }

  def initialize(set)
    @results_h = DESCRIPTIONS[set].inject({}, &method(:get_results))
    @total     = @results_h.map(&:last).inject(:+)
  end

  def results
    [@total, @results_h.inject({}, &method(:format))]
  end

  private

  def dF
    rand(-1..1)
  end

  def format(memo, pair)
    concern, result = *pair
    new_pair        = { concern => FORMAT_DF[result] }
    memo.merge(new_pair)
  end

  def get_results(memo, desc)
    memo.merge(desc => dF)
  end

end

set = ARGV[0] || :destiny
puts Roll.new(set.to_sym).results
