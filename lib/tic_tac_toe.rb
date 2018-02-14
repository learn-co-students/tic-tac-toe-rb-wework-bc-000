# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Middle row
  [0,4,8],  # Middle row
  [2,4,6],
  [2,5,8],
  [1,4,7],
  [0,3,6]
  # ETC, an array for each win combination
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && board[combo[0]] != " "
      return combo
    end
  end
  return false
end

def full?(board)
  !(board.include? " ")
end

def draw?(board)
  if (!full?(board))
    return false
  end
  !(won?(board))
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if (draw?(board))
    nil
  elsif won?(board)
    return board[won?(board)[0]]
  end
  nil
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

def valid_move?(board, index)
  if index.between?(0,8)
    if !position_taken?(board, index)
      true
    end
  end

  # position.to_i.between?(0,8) && !position_taken?(board, position.to_i-1)
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

def position_taken?(board, index)
  board[index] != " "
end

def move(board, index, current_player)
  board[index] = current_player
end
def turn_count(board)
  # board.count{|token| token == "X" || token == "O"}

  turns = 0
  board.each do |token|
    if token == "X" || token == "O"
      turns += 1
    end
  end
  turns

end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def play(board)
  while (!over?(board))
    turn(board)
  end
  if (draw?(board))
    puts "Cat's Game!"
  else
    puts "Congratulations #{winner(board)}!"
  end
end
