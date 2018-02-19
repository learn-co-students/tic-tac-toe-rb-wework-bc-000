WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
  ]

##################
# Helper Methods #
##################
def valid_move?(board,index)
  return index.between?(0,8) && !position_taken?(board,index)
end

def input_to_index(input)
  return input.to_i - 1
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def position_taken?(board, index)
  if (board[index] == " ") then
    return false
  elsif (board[index] == "") then
    return false
  elsif (board[index] == nil) then
    return false
  else
    return true
  end
end

def move(boardArray, index, char)
  boardArray[index] = char
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index) then
    move(board, index, "X")
  else
    turn(board)
  end
  display_board(board)
end

def turn_count(board)
  counter = 0
  board.each do |position|
    if position == "X" || position == "O" then
      counter += 1 
    end
  end
  return counter
end

def current_player(board)
  count = turn_count(board)
  if count % 2 == 0 then
    return "X"
  else
    return "O"
  end
end

def won?(board)
  winning_combo = nil
  WIN_COMBINATIONS.each do |combo|
    position_1 = combo[0]
    position_2 = combo[1]
    position_3 = combo[2]
    if board[position_1] == "X" && board[position_2] == "X" && board[position_3] == "X"
      winning_combo = combo
    elsif board[position_1] == "O" && board[position_2] == "O" && board[position_3] == "O" then
      winning_combo = combo
    end
  end
  winning_combo
end

def full?(board)
  board.each do |position|
    #position == "X" || position == "O"
    if position == " "
      return false
    end
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end

def play(board)
  counter = 0
  until counter == 9 do
    counter += 1
    turn(board)
  end
end