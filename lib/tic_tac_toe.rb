def display_board(board)
  puts  " #{board[0]} | #{board[1]} | #{board[2]} "
  puts  "-----------"
  puts  " #{board[3]} | #{board[4]} | #{board[5]} "
  puts  "-----------"
  puts  " #{board[6]} | #{board[7]} | #{board[8]} "
end 


def input_to_index(input)
  input.to_i - 1
end

def move(array, index, value)
  array[index] = value 
end 

def position_taken?(board, index)
   !(board[index] == nil || board[index] == " " || board[index] == "" )
end

def valid_move?(board, index)
    index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board,index)
    puts 'valid move'
    move(board, index, "X")
    display_board(board)
   else
    puts 'try again'
    turn(board)
  end
end

def play(board)
 9.times do turn(board) end
end


WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6, 7, 8], [0, 4, 8], [2, 4, 6], [0, 3, 6], [1, 4, 7], [2, 5, 8] ]


def won?(board)

  if WIN_COMBINATIONS.any? { |x| x.all? { |y| board[y] =="X" }} 
    return true
  elsif WIN_COMBINATIONS.any? { |x| x.all? { |y| board[y] =="O" }}
    return true
  end
end


def full?(board)
  if !(board.any? { |x| x == " " } || board.any? { |x| x == "" })
    return true
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif !won?(board) && !full?(board)
    return false
  end
end

def over?(board)
  if draw?(board) ||  full?(board)  ||  won?(board)
    return true
  end
end

def winner?(board)
    if full?(board) || board.all? {|x| x == " "} || board.all? {|x| x == ""}
      return false
    elsif WIN_COMBINATIONS.any? { |x| x.all? { |y| board[y] =="X" }}
      puts "X"
    elsif WIN_COMBINATIONS.any? { |x| x.all? { |y| board[y] =="O" }}
      puts "O"
    else
      return nil
    end
  
end





  
