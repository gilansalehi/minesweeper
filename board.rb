class Board
  GRID_SIZE = 9

  attr_reader :num_bombs, :grid
  def initialize(num_bombs)
    @grid = Array.new(GRID_SIZE) {Array.new(GRID_SIZE)}
    @num_bombs = num_bombs
  end

  def populate
    grid.each_with_index do |row , i|
      row.each_with_index do |cell, j|
        cell = Tile.new([i,j], bomb = false)
      end
    end
    assign_bomb

  end

  def assign_bomb
    x_rand = rand(GRID_SIZE)
    y_rand = rand(GRID_SIZE)

    num_bombs.times {self.grid[x_rand, y_rand].set_bomb}
  end
end
