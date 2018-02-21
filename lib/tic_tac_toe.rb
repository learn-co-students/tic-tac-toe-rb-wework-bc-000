# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [2,5,8],
  [1,4,7],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  xs = find_indexes(board, "X")
  os = find_indexes(board, "O")
  WIN_COMBINATIONS.find { |arr| (arr - xs).empty? || (arr - os).empty? }
end

def find_indexes(board, x_o)
  board.map.with_index { |o, i|
    if o == x_o
      i
    else
      -1
    end
  }.select do |cell|
    cell != -1
  end  
end

def full?(board)
  !board.include?(" ")
end

def draw?(board)
  w = won?(board)
  if !w.nil?
    false
  elsif w.nil?
    full?(board)
  end  
end

def over?(board)
  !won?(board).nil? || draw?(board) || full?(board)
end

def winner(board)
  w = won?(board)
  if (w.nil?)
    nil
  else  
    board[w[0]]
  end
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

def move(board, position, current_player)
  board[position] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

# def turn(board)
#   puts "Please enter 1-9:"
#   input = gets.strip
#   index = input_to_index(input)
#   valid = valid_move?(board, index)
#   if valid
#     move(board, index)
#     display_board(board)
#   else
#     turn(board)
#   end
# end

def turn(board)
  puts "Where would you like to go?"
  input = gets.strip
  index = input_to_index(input)
  
  if valid_move?(board, index)
    move(board, index, "X")
    display_board(board)
  else
    puts "boo"
    turn(board)
  end  
end

# Define your play method below
def play(board)
  count = 0
  while count < 9
    turn(board)
    count = count + 1
  end
end

def turn_count(board)
  notEmpty = board.select do |cell|
    cell != " "
  end
  notEmpty.size
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end