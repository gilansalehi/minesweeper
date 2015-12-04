require_relative 'tile'
require_relative 'minesweeper'
require 'byebug'

class Board
  GRID_SIZE = 9

  NEIGHBORS = [
    [-1, 1], [0, 1], [1, 1],
    [-1, 0], [1, 0],
    [-1, -1], [0, -1], [1, -1]
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

  def assign_bomb
    # change this to an array of eight different positions and take(8)
    num_bombs.times do
      x_rand = rand(GRID_SIZE)
      y_rand = rand(GRID_SIZE)
      self[x_rand,y_rand].bomb = true

      # increase value for neighbors of a bomb
      get_neighbors([x_rand, y_rand]).each do |position|
        self[*position].value += 1
      end
    end
  end

  def reveal_tile(position)
    self[*position].reveal
    tile_value = self[*position].reveal

    if tile_value == 0 #&& self[*position].status == :H
      reveal_neighbors(position)
    end
  end

  def place_flag(position)
    self[*position].status = :F
  end

  def reveal_neighbors(pos)
    get_neighbors(pos).each do |neighbor| #get_neighbors returns array of positions
      reveal_tile(neighbor) unless self[*neighbor].status == :revealed #|| self[*neighbor.status] == :F
    end
  end

  # #returns integer
  # def neighbor_bomb_count
  #   bomb_count = 0
  #   neighbors.each do | n_pos |
  #     p n_pos
  #     bomb_count += 1 if board.has_bomb?(n_pos)
  #   end
  #
  #   bomb_count
  # end


  def get_neighbors(pos)
    neighbor_pos = []
    NEIGHBORS.each do | n_pos |
      x = pos[0] + n_pos[0]
      y = pos[1] + n_pos[1]
      if x >= 0 && y >= 0 && x < GRID_SIZE && y < GRID_SIZE
        neighbor_pos << [x, y]
      end
    end
    neighbor_pos
  end

  def render
    grid.each do |row|
      row.each do |cell|
        if cell.status == :revealed
         print " #{cell.value}"
        else
         print " #{cell.status}"
        end
      end
    print "\n"
    end
  end


end
