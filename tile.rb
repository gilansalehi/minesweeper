require_relative 'board'
require_relative 'minesweeper'
require 'byebug'

class Tile

  SYMBOLS = [:H, :F, :*]


  attr_reader :pos, :board
  attr_accessor :value, :bomb, :status

  def initialize(board, pos, bomb = false, status = :revealed)
    @board = board
    @pos = pos
    @bomb = bomb # a boolean, default to false (true if contains a bomb)
    @status = status # hidden or revealed or Flagged
    @value = neighbor_bomb_count
  end

  def reveal
    # if my value is zero, call reveal on all my neighbors too
    # maybe delegate this responsibility to the Board class
    @status = :revealed
    # if value == 0
    #   neighbors.each.reveal
    # end
    bomb ? :* : value
  end

  #returns an array of array positions
  def neighbors
    neighbor_pos = []
    NEIGHBORS.each do | n_pos |
      x = pos[0] + n_pos[0]
      y = pos[1] + n_pos[1]
      neighbor_pos << [x, y]
    end
    neighbor_pos
  end
  
  #returns integer
  def neighbor_bomb_count
    bomb_count = 0
    neighbors.each do | n_pos |
      p n_pos
      bomb_count += 1 if grid.has_bomb?(n_pos)
    end

    bomb_count
  end

  def set_bomb
    @bomb = true
  end
end
