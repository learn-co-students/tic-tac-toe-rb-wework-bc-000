def turn(board)
  
  puts "Please enter 1-9:"
  input=gets.strip
  index = input_to_index(input)
  
  if valid_move?(board, index)
    token = current_player(board)
    move(board, index, token)
    display_board(board)
  else
    turn(board)
  end

end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(index)
 index.to_i - 1
end

def move(board, index, token)
  board[index] = token
end


def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board,index)
   if position_taken?(board,index)
    false 
   elsif
     index.between?(0,8)
       true
     if index.between?(0,8)
       TRUE
     else
       FALSE
     end
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
  board.all?{|i| (i=="X"||i=="O")}
end

def draw?(board)
  !won?(board) && full?(board)
end 

def turn_count(board)
  board.count{|token| token == "X" || token == "O"}
end

def current_player(board)
  if turn_count(board).even?
    current_player = "X"
  else
    current_player = "O"
  end
end



def over?(board)
  if draw?(board) 
    TRUE
  elsif
    full?(board) && won?(board)
    TRUE
  elsif
    won?(board) && !full?(board)
    TRUE
  else
    FALSE
  end
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end

def play(board)
  while over?(board) == FALSE
    turn(board)
  end
  game_winner = winner(board)
  if won?(board)  
    puts "Congratulations #{game_winner}!"
  else
    puts "Cat\'s Game!"
  end
end
