class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS =
  [[0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]]
# end

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def over?(board)
  full?(board) || won?(board)
end

def draw?(board)
  full?(board) && !won?(board)
end

def winner(board)
  if won?(board).kind_of?(Array)
    board[won?(board)[0]]
  end
end

def move(position, current_player)
    @board[position] = current_player
end

def position_taken?(board, index)
  board[index] != " " && board[index] != ""
end

def valid_move?(board, index)
  index.between?(0, 8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  index = input_to_index(gets.strip)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def play(board)
  while !over?(board) && !draw?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
end
