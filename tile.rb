class Tile

  SYMBOLS = [:., :F, :*]

  attr_reader :value, :bomb, :status

  def initialize(pos, bomb = false, status = :hidden)
    @pos = # [x, y]
    @bomb = bomb # a boolean, default to false (true if contains a bomb)
    @status = status # hidden or revealed or Flagged
    @value = neighbor_bomb_count
  end

  def reveal
    # if my value is zero, call reveal on all my neighbors too
    # maybe delegate this responsibility to the Board class
    self.status = :revealed
    bomb ? :* : value
  end

  def neighbors
  end

  def neighbor_bomb_count
  end

  def set_bomb
    self.bomb = true
  end
end
