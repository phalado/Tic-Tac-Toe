class TicTacLogic
  atrr_acessor :player1, :player2, :play
  attr_reader :board

  def initialize()
    @play = false
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @avaiable = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @playert = true
  end

  def move(num)
    begin
      unless avaiable.include?(num)
    rescue StandardError => e
      p "Error!!"
      retry
    end
    @board[num] = @playert ? "X" : "O"
  end
end