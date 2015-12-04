require_relative 'tile'
require_relative 'minesweeper'
require 'byebug'
class Board
  GRID_SIZE = 9

  NEIGHBORS = [
    [-1,1], [0,1], [1,1],
    [0,-1], [-1,1],
    [-1,-1], [0,-1], [1,-1]
  ]

  attr_reader :num_bombs
  attr_accessor :grid

  def initialize(num_bombs)
    @grid = Array.new(GRID_SIZE) do |row|
      Array.new(GRID_SIZE) do |col|
        Tile.new(self, [row, col], false)
      end
    end
    @num_bombs = num_bombs
    assign_bomb
  end

  def [](x, y)
    self.grid[x][y]
  end

  def []=(x, y, mark)
    self.grid[x][y] = mark
  end

  def has_bomb?(position)
    grid[position[0]][position[1]].bomb

  end

  def assign_bomb
    # change this to an array of eight different positions and take(8)
    num_bombs.times do
      x_rand = rand(GRID_SIZE)
      y_rand = rand(GRID_SIZE)
      grid[x_rand, y_rand].set_bomb
    end
  end

  def reveal_neighbors(pos)
    # to do
  end

  def render
    grid.each do |row|
      row.each do |cell|
        if cell.bomb
          print " *"
        elsif cell.status == :revealed
         print " #{cell.value}"
        else
         print " #{cell.status}"
        end
      end
    print "\n"
    end
  end

end
