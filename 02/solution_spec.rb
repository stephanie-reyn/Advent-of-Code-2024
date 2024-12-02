# frozen_string_literal: true

require 'rspec'
require 'benchmark'

def parse(string)
  string.split("\n").map { |line| line.split.map(&:to_i)}
end

def part1(input)
  reports = parse(input)

  # Count the number of safe reports
  safe_reports = reports.count do |levels|

    is_increasing = levels.each_cons(2).all? do |a, b|
      b > a && (b - a).between?(1, 3)
    end

    is_decreasing = levels.each_cons(2).all? do |a, b|
      b < a && (a - b).between?(1, 3)
    end

    is_increasing || is_decreasing
  end

  safe_reports
end


def part2(input)
  reports = parse(input)

  safe_reports = reports.count do |levels|
    is_increasing = levels.each_cons(2).all? do |a, b|
      b > a && (b - a).between?(1, 3)
    end

    is_decreasing = levels.each_cons(2).all? do |a, b|
      b < a && (a - b).between?(1, 3)
    end

    if is_increasing || is_decreasing
      true
    else
      (0...levels.size).any? do |i|
        modified_levels = levels[0...i] + levels[i+1..]

        is_increasing = modified_levels.each_cons(2).all? do |a, b|
          b > a && (b - a).between?(1, 3)
        end
        is_decreasing = modified_levels.each_cons(2).all? do |a, b|
          b < a && (a - b).between?(1, 3)
        end

        if is_increasing || is_decreasing
          true
        else
          false
        end
      end
    end
  end

  safe_reports
end




describe 'advent of code 2024, day 2' do
  it 'input can be parsed' do
    expect(parse("1\n2\n3\n")).to eq([[1], [2], [3]])
  end

  it 'part1 gives correct solution with test data, gives result for input data' do
    expect(File.exist?(input_filename)).to be(true), "input file #{input_filename} not found - did you run rake?"
    expect(File.exist?(test_input_filename)).to be(true),
                                                "input file #{test_input_filename} not found - did you run rake?"
    expect(Object.private_method_defined?(:part1)).to be(true), 'define method part1 to get started'
    #
    # fill in the expected result for the test data here:
    #
    expect(part1(File.binread(test_input_filename))).to eq(2)

    #
    # the run with real data will only start after test data works correctly
    #
    filename = "#{File.dirname(__FILE__)}/input.txt"
    input = File.binread(input_filename)
    puts '  =========== running part 1 ================='
    result = part1(input)
    puts '  -------------------------------------------'
    puts "  RESULT: #{result}"
    puts '  -------------------------------------------'
    puts '  user     system      total        real'
    puts(Benchmark.measure { part1(input) })
    puts '  ==========================================='
  end

  it 'part2 gives correct solution with test data' do
    expect(Object.private_method_defined?(:part2)).to be(true), 'define method part2 to get started'
    #
    # fill in the expected result for the test data here:
    #
    expect(part2(File.binread(test_input_filename))).to eq(4)

    #
    # the run with real data will only start after test data works correctly
    #
    input = File.binread(input_filename)
    puts '  =========== running part 2 ================='
    result = part2(input)
    puts '  -------------------------------------------'
    puts "  RESULT: #{result}"
    puts '  -------------------------------------------'
    puts '  user     system      total        real'
    puts(Benchmark.measure { part2(input) })
    puts '  ==========================================='
  end
end

def test_input_filename
  "#{File.dirname(__FILE__)}/test_input.txt"
end

def input_filename
  "#{File.dirname(__FILE__)}/input.txt"
end
