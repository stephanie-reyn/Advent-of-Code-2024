# frozen_string_literal: true

require 'rspec'
require 'benchmark'

def parse(string)
  string.split("\n").map(&:to_i)
end

def part1(input)
  left = parse(input)

  # Extract the right list
  right = input.split("\n").map { |line| line.split.last.to_i }

  left.sort!
  right.sort!

 # Calculate total distance
 total_distance = left.zip(right).map { |left, right| (left - right).abs }.sum

 total_distance
end

describe 'advent of code 2024, day 1' do
  it 'input can be parsed' do
    expect(parse("1\n2\n3\n")).to eq([1, 2, 3])
  end

  it 'part1 gives correct solution with test data, gives result for input data' do
    expect(File.exist?(input_filename)).to be(true), "input file #{input_filename} not found - did you run rake?"
    expect(File.exist?(test_input_filename)).to be(true),
                                                "input file #{test_input_filename} not found - did you run rake?"
    expect(Object.private_method_defined?(:part1)).to be(true), 'define method part1 to get started'
    #
    # fill in the expected result for the test data here:
    #
    expect(part1(File.binread(test_input_filename))).to eq(11)

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

  skip 'part2 gives correct solution with test data' do
    expect(Object.private_method_defined?(:part2)).to be(true), 'define method part2 to get started'
    #
    # fill in the expected result for the test data here:
    #
    expect(part2(test_input_filename)).to eq(1924)

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
