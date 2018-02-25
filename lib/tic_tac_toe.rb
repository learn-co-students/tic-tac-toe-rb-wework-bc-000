board = [" "," "," "," "," "," "," "," "," "]

def welcome
  puts puts "Welcome to Tic Tac Toe!"
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index (input)
  input = input.to_i - 1
end

def move (board, index, character)
  if board [index] == " "
    board [index] = character
  else
    puts "Space already taken!"
  end
end

# Helper Method
def turn_count(board)
  #counter = 0
    #board.each do|token|
      #if token == "X" || token == "Y"
        #counter += 1
      #end
    #end
  #counter
  board.count{|token| token == "X" || token == "O"}
end

def current_player(board)
  if turn_count(board)% 2 == 0
    "X"
  else
    "O"
  end
end

def position_taken?(board,index)
  board[index] == "X" || board[index] == "O"
end

def valid_move? (array,index)
  if index < 0 || index > 8
    false
  elsif array[index] == "X"
    false
  elsif array[index] == "O"
    false
  else
    true
  end
end

def turn(board)
  puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

# Define your WIN_COMBINATIONS constant
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

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all? do |space|#{|space| space == "X" || space == "O"}
    space == "X" || space == "O"
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    board[won?(board).first]
  end
end

def play(board)
  if !over?(board)
    turn(board)
    play(board)
  elsif winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
