class Game

  # Game initilaizes a board
  # then in a play method run a loop until game over
  # # in play loop, prompt user
  def initialize(num_bombs = 8)
    @board = Board.new(num_bombs)
  end

  def play
    #setup
    board.render
    until over?
      prompt_user # to be defined
      board.render
    end

  end

  def over?
    # true if board.include?(:*)
    # or if number of hidden squares == num_bombs
  end

  def prompt_user
  end

end

if __FILE__ == $PROGRAM_NAME
  minesweeper_game = Game.new()
  minesweeper_game.play
end
