# frozen_string_literal: true

class TicTacLogic
  attr_reader :board, :play, :playert, :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @play = true
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @playert = true
  end

  def move(num)
    if num.positive? && num <= 9 && @board[num - 1].is_a?(Integer)
      @board[num - 1] = @playert ? :X : :O
      return true
    end
    false
  end

  def game_end?
    if victory || vic_diagonal
      @play = false
      true
    elsif @board.none?(Integer)
      @play = false
      false
    else
      @playert = !@playert
      -1
    end
  end

  def victory
    (0..2).each do |i|
      if ((@board[i * 3] == @board[(i * 3) + 1]) &&
         (@board[i * 3] == @board[(i * 3) + 2])) ||
         ((@board[i] == @board[i + 3]) &&
         (@board[i] == @board[i + 6]))
        return true
      end
    end
    false
  end

  def vic_diagonal
    if ((@board[0] == @board[4]) &&
       (@board[0] == @board[8])) ||
       ((@board[2] == @board[4]) &&
       (@board[2] == @board[6]))
      true
    else
      false
    end
  end

  def current_player
    @playert ? @player1 : @player2
  end
end
