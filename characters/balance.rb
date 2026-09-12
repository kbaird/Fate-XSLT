#!/usr/bin/env/ruby
# frozen_string_literal: true

require 'nokogiri'

# Reports on skill build costs for Weird Characters in the
# Atomic Robo RPG. Each character has a 30-point mode budget.
class BalanceReporter
  MODE_POINT_BUDGET = 30

  attr_reader :total

  def initialize(path)
    @document = Nokogiri::XML(File.read(path))
    @total = 0
  end

  def report
    lines = modes.map do |mode|
      total = mode_cost(mode)
      @total += total
      "#{mode_name(mode)} costs #{total}"
    end
    lines << "#{MODE_POINT_BUDGET - @total} pts remaining"
    lines
  end

  private

  def modes
    @document.xpath('//mode')
  end

  def mode_name(mode)
    mode.attribute('name').value
  end

  def mode_cost(mode)
    skills = mode.xpath('skill')
    [skills.map(&int_attribute('cost')), skills.map(&int_attribute('add'))].flatten.inject(0, &:+)
  end

  def int_attribute(attr)
    ->(skill) { skill.attribute(attr)&.value.to_i }
  end
end

if $PROGRAM_NAME == __FILE__
  ARGV.each { |path| puts BalanceReporter.new(path).report }
end
