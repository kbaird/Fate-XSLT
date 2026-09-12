# frozen_string_literal: true

require 'minitest/autorun'
require 'tmpdir'

require_relative '../characters/balance'

class BalanceReporterTest < Minitest::Test
  MODE = ->(name, skills) do
    "<mode name=\"#{name}\">#{skills.join}</mode>"
  end

  def write_character(modes)
    Dir.mktmpdir do |dir|
      path = File.join(dir, 'character.xml')
      File.write(path, "<character>#{modes.join}</character>")
      yield path
    end
  end

  def test_reports_each_mode_cost_and_points_remaining
    write_character([
      MODE.call('Soldier', ['<skill name="Athletics" cost="2"/>', '<skill name="Will" cost="1"/>']),
      MODE.call('Action', ['<skill name="Combat" cost="2"/>'])
    ]) do |path|
      output = BalanceReporter.new(path).report

      assert_equal "Soldier costs 3", output[0]
      assert_equal "Action costs 2", output[1]
      assert_equal "25 pts remaining", output[2]
    end
  end

  def test_mode_name_renders_plain_value_not_attribute_node
    write_character([MODE.call('Super Soldier', ['<skill name="Will" cost="1"/>'])]) do |path|
      output = BalanceReporter.new(path).report

      assert_equal "Super Soldier costs 1", output[0]
    end
  end

  def test_add_attributes_are_summed_with_skill_costs
    write_character([
      MODE.call('Science', ['<skill name="Physics" cost="2" add="1"/>', '<skill name="Chem" cost="1"/>'])
    ]) do |path|
      output = BalanceReporter.new(path).report

      assert_equal "Science costs 4", output[0]
      assert_equal "26 pts remaining", output[1]
    end
  end

  def test_missing_cost_or_add_attribute_is_treated_as_zero
    write_character([MODE.call('Action', ['<skill name="Combat"/>', '<skill name="Athletics" cost="2"/>'])]) do |path|
      output = BalanceReporter.new(path).report

      assert_equal "Action costs 2", output[0]
      assert_equal "28 pts remaining", output[1]
    end
  end

  def test_points_remaining_are_reported_per_character
    Dir.mktmpdir do |dir|
      path_full = File.join(dir, 'full.xml')
      path_short = File.join(dir, 'short.xml')
      File.write(path_full, '<character><mode name="A"><skill name="x" cost="30"/></mode></character>')
      File.write(path_short, '<character><mode name="A"><skill name="x" cost="28"/></mode></character>')

      full_report = BalanceReporter.new(path_full).report
      short_report = BalanceReporter.new(path_short).report

      assert_match(/0 pts remaining\z/, full_report.last)
      assert_match(/2 pts remaining\z/, short_report.last)
    end
  end
end
