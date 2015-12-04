require_relative 'board'
require_relative 'tile'

class Game

  attr_accessor :board, :over_status

  # Game initilaizes a board
  # then in a play method run a loop until game over
  # # in play loop, prompt user
  def initialize(num_bombs = 8)
    @board = Board.new(num_bombs)
    @over_status = false
  end

  def play
    #setup
    board.render
    until over_status # Fix this
      position = prompt_user
      board.reveal_tile(position)

      board.render
    end
    puts "Game over!"
  end

  def over
    over_status = true
  end

  def prompt_user
    # puts "Place flag [F] or search position [S]"
    # search_or_flag = gets.chomp
    pos = gets.chomp.split(",")
    pos_x = pos[0]
    pos_y = pos[1]
    pos2 = [pos_x.to_i, pos_y.to_i]
    # [pos2, search_or_flag]
  end

end

if __FILE__ == $PROGRAM_NAME
  minesweeper_game = Game.new(8)
  minesweeper_game.play
end
