# Helper Methods
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

def play(board)
  9.times do
    turn(board)
  end
end

def turn_count(board)
  i = 0
  board.each do |square|
    if square != " " then i += 1 end
  end
  return i
end

def current_player(board)
  if turn_count(board).even?
    return "X"
  else
    return "O"
  end
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  ["X","O"].each do |token|
    WIN_COMBINATIONS.each do |pattern|
      if pattern.all?{|entry| board[entry] == token} then
        return pattern
      end
    end
  end
  return false
end
        
def full?(board)
  board.all? do |entry|
    entry == "X" || entry == "O"
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return TRUE
  else
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return TRUE
  else
    return false
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    return nil
  end
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]