#!/usr/bin/env ruby
# elven_name.rb

# descriptive die rolls for FUDGE/Fate, as per an idea developed
# by Vincent Baker for his Jastenave game.
# cf. https://twitter.com/lumpleygames/status/403556521579384832
#
# Also appeared later (and surely independently) in Pyramid Vol2
# "Dice of Destiny" by Justin Bacon
# http://www.sjgames.com/pyramid/sample.html?id=1686
# http://thealexandrian.net/wordpress/2781/roleplaying-games/dice-of-destiny

class ElvenName

  PREFIX_FILE = './elven_prefixes.txt'
  SUFFIX_FILE = './elven_suffixes.txt'

  def initialize
    @prefix_of = construct(PREFIX_FILE)
    @suffix_of = construct(SUFFIX_FILE)
  end

  def print_results
    puts
    10.times { print_result }
    puts
  end

  private

  def construct(fn)
    lines = File.readlines(fn)
    lines.inject({}) do |memo,line|
      rngs, prefix = line.strip.split(/ +/)
      lo, hi       = rngs.split("-").map(&:to_i)
      lo.upto(hi) do |idx|
        memo[idx] = prefix
      end
      memo
    end
  end

  def noble?
    rand(5) > 3
  end

  def print_result
    name  = @prefix_of[rand(100)+1] + @suffix_of[rand(100)+1]
    name += @suffix_of[rand(100)+1] if noble?
    puts name
  end

end

ElvenName.new.print_results
