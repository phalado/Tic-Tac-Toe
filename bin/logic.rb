class TicTacLogic
  attr_accessor :player1, :player2
  attr_reader :board, :play, :playert

  def initialize()
    @play = true
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @avaiable = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @playert = true
  end

  def move(num)
    p "Please, type the number of an avaiable spot." unless avaiable.include?(num)
    @board[num] = @playert ? "X" : "O"
  end

  def game_end?
    if victory
      @play = false
      returning = "Game over - Winner: "
      returning << @playert ? @player1 : @player2
      return returning
    elsif avaiable == []
      @play = false
      return "Game over - it's a tie"
    else
      @playert = !@playert
      returning << @playert ? @player1 : @player2
      returning = " choose a avaiable spot."
      return returning
    end
  end

  def victory
    [0..2].each do |i|
      return true if ((@board[i * 3] == @board[(i * 3) + 1]) && (@board[i * 3] == @board[(i * 3) + 2])) ||
      ((@board[i] == @board[i + 3]) && (@board[i] == @board[i + 6])) ||
    end
    return true if ((@board[0] == @board[4]) && (@board[0] == @board[8])) ||
    ((@board[2] == @board[4]) && (@board[2] == @board[6]))
    false
  end
end