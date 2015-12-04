class Tile

  SYMBOLS = [:H, :F, :*]

  attr_reader :value, :bomb
  attr_accessor :status

  def initialize(pos, bomb = false, status = :H)
    @pos = pos
    @bomb = bomb # a boolean, default to false (true if contains a bomb)
    @status = status # hidden or revealed or Flagged
    @value = neighbor_bomb_count
  end

  def reveal
    # if my value is zero, call reveal on all my neighbors too
    # maybe delegate this responsibility to the Board class
    @status = :revealed
    bomb ? :* : value
  end

  def neighbors
  end

  def neighbor_bomb_count
  end

  def set_bomb
    @bomb = true
  end
end
