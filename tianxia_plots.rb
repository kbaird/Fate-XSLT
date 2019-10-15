#!/usr/bin/env ruby

PLOT = {
  who: [
    'Ruthless bandits',
    'Evil cultists',
    'Corrupt officials',
    'Despicable pirates',
    'A desperate lover',
    'Misguided monks',
    'Amoral mercenaries',
    'A Kung Fu school',
    'Barbarian raiders',
    'Fiendish slavers',
    'Lin Kuei assassins',
    'Red Banner rebels',
    'Triad gangsters',
    'Ambitious thugs',
    'Imperial spies'
  ],

  what: [
    'want(s) to steal the family heirloom',
    'seek(s) the journal',
    'want(s) to destroy the reputation',
    'raid(s) the holdings',
    'attack(s) the establishment',
    'seek(s) the secrets',
    'kidnap(s) the children',
    'seek(s) the skills',
    'seek(s) the location of a lost treasure',
    'seek(s) the aid',
    'is/are seeking the true identity',
    'plan(s) to ambush',
    'war(s) with the allies',
    'seek(s) the replacement',
    'plot(s) the murder or abduction'
  ],

  of: [
    'a wealthy merchant',
    'a nobleman',
    'a holy man or woman',
    'a security company',
    'a kung fu master',
    'a famous warrior',
    'a beautiful courtesan',
    'a famous craftsman',
    'a triad boss',
    'a bandit chief',
    'a humble peasant family',
    'a local celebrity',
    'a senior magistrate',
    'a famous scholar',
    'the PCs'
  ],

  that: [
    'satisfy the wishes of their master',
    'ensure their loyalty or love',
    'is due to a big misunderstanding',
    'prove their superiority',
    'has foiled them in the past',
    'discover secret kung fu knowledge',
    'can be sold for a small fortune',
    'ultimately swell their ranks',
    'complete their revenge',
    'grow their influence in the area',
    'complete an ancient prophecy',
    'fund their future schemes',
    'satisfy an age-old debt',
    'could ruin a good person’s reputation',
    'power a terrible ritual'
  ],

  but: [
    'the victim actually desires this outcome!',
    'a stubborn magistrate is on their trail!',
    'the whole plan is a ruse!',
    'an ally of the PCs is hired to stop them!',
    'secret lovers on both sides get involved!',
    'another group has the same plans!',
    'a Kung Fu master has taken interest!',
    'first a duel must be arranged!',
    'the PCs are framed for the scheme!',
    'the victim hides a terrible truth!',
    'a hapless youth witnesses everything!',
    'the imperial army is also involved!',
    'their actions could start a war!',
    'the fallout will destroy many lives!',
    'time is of the essence!'
  ]
}.freeze

def pick(list)
  list[rand(list.size)]
end

def plot
  print pick(PLOT[:who])
  print ' '
  print pick(PLOT[:what])
  print ' of '
  print pick(PLOT[:of])
  print ' that/to '
  print pick(PLOT[:that])
  print ', but '
  print pick(PLOT[:but])
  puts
end

puts
20.times { plot }
puts
