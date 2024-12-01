# frozen_string_literal: true

require 'rspec'

class HashBoard
  attr_reader :board

  def initialize(tile: '.', trace: false)
    @board = Hash.new(0)
    @tile = tile
    @trace = trace
  end

  def set(vector, value = 1)
    @board[vector] = value
  end

  def points
    @board
  end

  def plot
    xes = board.keys.map { |v| v[0] }
    max_x = 1 + xes.max
    min_x = xes.min

    ys = board.keys.map { |v| v[1] }
    max_y = ys.max
    min_y = ys.min

    height = max_y - min_y + 1
    width = max_x - min_x

    tile = @tile
    line = "#{tile * width}\n"
    plot = line * height

    if @trace
      puts "board sized #{width} x #{height} has length #{plot.length}"
      puts plot
      puts "will now paint in #{board.length} tiles: #{board.keys}"
    end
    board.each_pair do |key, value|
      x0, y0 = key.to_a
      x = x0 - min_x
      y = - y0 + max_y
      string_coordinate = (y * (width + 1)) + x
      puts "for (#{x0},#{y0})->(#{x},#{y}) plot #{string_coordinate} of #{plot.length}" if @trace
      plot[string_coordinate] = if value.to_s.length == 1
                                  value.to_s
                                else
                                  '#'
                                end
    end
    puts plot if @trace
    plot
  end

  def value
    @board.values.count
  end
end

describe 'HashBoard' do
  it 'can plot a 1x1 board' do
    board = HashBoard.new
    board.set([0, 0])
    expect(board.plot).to eq("1\n")
  end

  it 'can plot a 2x2 board' do
    board = HashBoard.new(tile: '_')
    board.set([0, 0])
    board.set([1, 1])
    board.set([1, 0])
    expect(board.plot).to eq("_1\n11\n")
  end

  it 'can plot a bigger board' do
    board = HashBoard.new
    board.set([0, 0])
    board.set([5, 0])
    board.set([0, -1])
    board.set([1, 1])
    expect(board.plot).to eq(
      ".1....\n" \
      "1....1\n" \
      "1.....\n"
    )
  end
end
