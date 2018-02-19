
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  index = user_input.to_i - 1
end

def move(board, index, token)
  board[index] = token
end

def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
    true
  else
    false
  end
end

def valid_move?(board, index)
  if position_taken?(board, index) == false && index.between?(0,8) == true
    true
  else
    false
  end
end

def turn(board)
  puts "Please select your position (1-9)"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index) == true
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |element|
    if element == "X" || element == "O"
      counter = counter + 1
    end
  end
  counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      #true
      did_win = true
      return win_combination # return the win_combination indexes that won.
    else
      if win_combination == [2,4,6]

        #puts "last win combo test"
      end

      #puts "false section- win?"
    end
  end

  #false for empty board
  if board.detect{|i| i == "X"}

  elsif board.detect{|i| i == "O"}

  else
    false #empty board
  end
end


def full?(board)
  if board.detect{|i| i == " "}
    false
  elsif board.detect{|i| i == ""}
    false
  else
    true
  end
end

def draw?(board)
  if full?(board) == true && (won?(board) == false || won?(board) == nil)
    #puts board
    #puts "draw called- true"
    true
  else
    false
  end
#returns true if the board has not been won and is full
#false if the board is not won and the board is not full
#false if the board is won.

end

def over?(board)
  if won?(board) == true || draw?(board) == true || full?(board) == true
    true
  elsif full?(board) == false && won?(board).is_a?(Array) == true
    true
  else
    false
  end
end

def winner(board)
  if won?(board).is_a?(Array) == true
    if board[won?(board)[0]] == "X"
      "X"
    else
      "O"
    end
  else
    nil
  end
end

def play(board)

  until over?(board) == true do
    #input = gets
    turn(board)
  end

  if won?(board).is_a?(Array) == true
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board) == true
    puts "Cat's Game!"
  end

end
