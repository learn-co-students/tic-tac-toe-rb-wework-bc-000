require "pry"

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  
 # if !board.include? ("X" || "O")
  #  return false
 # end 
  
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    else   
      false
    end 
  end 
  
  return false
end 

def full?(board)
  board.all? {|i| i == "X" || i == "O"}
end 

def draw?(board)
  full?(board) && !won?(board)
end 

def over?(board)
  won?(board) || draw?(board)
end 

def winner(board)
  if won?(board)
    winning_combo = won?(board)
    return board[winning_combo[0]]
  # else 
  #   return nil 
  end 
end 

def turn_count(board)
  board.count { |x| x == "X" || x == "O"}
end 

def current_player(board)
  num = turn_count(board)
  num % 2 == 0 ? "X" : "O"
end 

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

def move(board, index, player_token)
  board[index] = player_token
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    player_token = current_player(board)
    move(board, index, player_token)
    display_board(board)
  else
    turn(board)
  end
end

def play(board)
  
  until over?(board)
    turn(board)
  end
  
  if won?(board)
    win = winner(board)
    puts "Congratulations #{win}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end 
  
end
