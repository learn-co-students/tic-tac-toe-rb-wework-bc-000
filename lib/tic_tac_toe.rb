def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def valid_move?(board, index)
  (index >= 0 && index <= 8) && !position_taken?(board,index)
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],
                    [3,4,5],
                    [6,7,8],
                    [0,3,6],
                    [1,4,7],
                    [2,5,8],
                    [0,4,8],
                    [6,4,2]
                   ]

def won?(board)
  if(board.reject{|box|box=="X" || box=="O"}.size == 9)
    return false
  else
    WIN_COMBINATIONS.each { |combo|
      if((board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]]) && board[combo[0]] != " ")
        return combo
      end
    }
    return false
  end
end

def full?(board)
    if(board.select{|box|box=="X" || box=="O"}.size == 9)
        return true
    end
    return false
end

def draw?(board)
  if(!won?(board) && full?(board))
    return true
  else
    return false
  end
end

def over?(board)
  if(draw?(board))
    return true
  elsif(won?(board))
    return true
  elsif(!full?(board))
    return false
  end
end

def winner(board)
  result = won?(board)
  if(result)
    return board[result[0]]
  else
    return nil
  end
end

def input_to_index(n)
  return n.to_i - 1
end

def move(board,index,move)
  board[index] = move
end

def turn_count(board)
  board.select {|box|box == "X" || box == "O"}.size
end

def current_player(board)
  if(turn_count(board) % 2 == 0)
    return "X"
  else
    return "O"
  end
end

def turn(board)
  index = input_to_index(gets.strip)
  if(valid_move?(board, index))
    puts "good"
    move(board,index,current_player(board))
  else
    turn(board)
  end
end

def play(board)
  puts "Enter input (1-9):"
  while(!over?(board))
    turn(board)
    display_board(board)
  end
  if(!draw?(board))
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end