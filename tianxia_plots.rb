#!/usr/bin/env ruby

PLOT = {
  who: [
    'Ruthless bandits',
    'Evil cultists',
    'Corrupt Officials',
    'Despicable pirates',
    'A desperate lover',
    'Misguided monks',
    'Amoral mercenaries',
    'A Kung Fu school',
    'Barbarian raiders',
    'Fiendish slavers',
    'Lin Kuei assassins',
    'Red Banner rebels',
    'Triad Gangsters',
    'Ambitious Thugs',
    'Imperial spies'
  ],

  what: [
    'Want(s) to steal the family heirloom',
    'Seek(s) the journal',
    'Want(s) to destroy the reputation',
    'Raid(s) the holdings',
    'Attack(s) the establishment',
    'Seek(s) the secrets',
    'Kidnap(s) the children',
    'Seek(s) the skills',
    'Seek(s) the location of a lost treasure',
    'Seek(s) the aid',
    'Is/Are seeking the true identity',
    'Plan(s) to ambush',
    'War(s) with the allies',
    'Seek(s) the replacement',
    'Plot(s) the murder or abduction'
  ],

  of: [
    'A wealthy merchant',
    'A nobleman',
    'A holy man or woman',
    'A security company',
    'A Kung Fu master',
    'A famous warrior',
    'A beautiful courtesan',
    'A famous craftsman',
    'A Triad boss',
    'A bandit chief',
    'A humble peasant family',
    'A local celebrity',
    'A senior magistrate',
    'A famous scholar',
    'The PCs'
  ],

  that: [
    'Satisfy the wishes of their master',
    'Ensure their loyalty or love',
    'Is due to a big misunderstanding',
    'Prove their superiority',
    'Has foiled them in the past',
    'Discover secret Kung Fu knowledge',
    'Can be sold for a small fortune',
    'Ultimately swell their ranks',
    'Complete their revenge',
    'Grow their influence in the area',
    'Complete an ancient prophecy',
    'Fund their future schemes',
    'Satisfy an age-old debt',
    'Could ruin a good person’s reputation',
    'Power a terrible ritual'
  ],

  but: [
    'The victim actually desires this outcome!',
    'A stubborn magistrate is on their trail!',
    'The whole plan is a ruse!',
    'An ally of the PCs is hired to stop them!',
    'Secret lovers on both sides get involved!',
    'Another group has the same plans!',
    'A Kung Fu master has taken interest!',
    'First a duel must be arranged!',
    'The PCs are framed for the scheme!',
    'The victim hides a terrible truth!',
    'A hapless youth witnesses everything!',
    'The imperial army is also involved!',
    'Their actions could start a war!',
    'The fallout will destroy many lives!',
    'Time is of the essence!'
  ]
}.freeze

def pick(list)
  list[rand(list.size)]
end

def plot
  print pick(PLOT[:who])
  print ' '
  print pick(PLOT[:what]).downcase
  print ' of '
  print pick(PLOT[:of]).downcase
  print ' that/to '
  print pick(PLOT[:that]).downcase
  print ', but '
  print pick(PLOT[:but]).downcase
  puts
end

puts
20.times { plot }
puts
