WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5], 
  [0,4,8],
  [6,7,8],
  [2,4,6],
  [2,5,8],
  [0,2,6],
  [0,3,6],
]

#start off with the display board
board = [" "," "," "," "," "," "," "," "," "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]}"
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]}"
  puts "-----------"
  puts " #{board[0]} | #{board[0]} | #{board[0]}"
end

#get user input via gets and a player will choose a position on the board by entering 1-9

def input_to_index(user_input)
  user_input.to_1 - 1 #they are entering a number we have to translate that to the board speak
end

def move(board, index, token)
  board[index] = token #the given input goes into the board spot with the provided token
end

def position_taken?(board, index)
  board[index] != " "
end

def valid_move?(board, index)
  index = [1-9]
  position_taken? = false 
end

def turn(board) 
  #ask for input
  #get input
  #convert input to index
  #if valid then make the move for index and show board
  #else ask for input again until you get a valid move and end
   puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  #take argument of board array and return the number of turns that have been played
    board.count{|token| token == "X" || token == "O"}
end

def current_player(board)
  #use turn count to see if x or o
    turn_count(board) % 2 == 0 ? "X" : "O"
end

def  won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end