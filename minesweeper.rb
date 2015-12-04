require_relative 'board'
require_relative 'tile'

class Game

  attr_accessor :board

  # Game initilaizes a board
  # then in a play method run a loop until game over
  # # in play loop, prompt user
  def initialize(num_bombs = 8)
    @board = Board.new(num_bombs)
  end

  def play
    #setup
    #board.populate
    # board.render
    # board.assign_bomb
    # until over?
    board.render
    #  prompt_user # to be defined
    #  board.render
    # end

  end

  def over?
    # true if board.include?(:*)
    # or if number of hidden squares == num_bombs
  end

  def prompt_user

  end

end

if __FILE__ == $PROGRAM_NAME
  minesweeper_game = Game.new(8)
  minesweeper_game.play
end
