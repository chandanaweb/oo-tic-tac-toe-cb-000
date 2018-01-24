class TicTacToe
  #intialize
  def initialize
      @board =[" "," "," "," "," "," "," "," "," "]
  end
 #constant that contains all possible winning combinations
 WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  #display_board
 def display_board
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
 end

 #valid_move
 def valid_move?(index)
 if index < 9 && index > -1 && @board[index] != 'X' && @board[index] != 'O'
  return true
 else
  return false
 end
end

#input_to_index
def input_to_index(num)
  return num.to_i - 1
end

#move
def move(index,token = 'X')
 return @board[index] = token
end

#turn
def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  isValid = valid_move?(index)
  if isValid === true
    move(index)
    display_board
    current_player
  else
    puts 'Please enter correct input'
    turn
    end
end

#position_taken
 def position_taken?(index)
   if (@board[index].nil? || @board[index] == " ")
    return false
   else
    return true
   end
end

#won
def won?
  if @board.all?{|position|position == " "}
    return false
  end
  no_combinations = true
WIN_COMBINATIONS.each do |combination|
  if combination1 = @board[combination[0]] == "X" && @board[combination[1]] == "X" && @board[combination[2]] == "X" ||
     combination2 = @board[combination[0]] == "O" && @board[combination[1]] == "O" && @board[combination[2]] == "O"
     no_combinations = false
    return combination
  end
 end
 if no_combinations == true
   return false
 end
end

#FULL method
def full?
  any_spaces =  @board.any?{|element| element == " "}
  if any_spaces== true
    return false
  else
    return true
  end
end

#draw
def draw?
incomplete_board = !full?
if incomplete_board == true
  return false
end
WIN_COMBINATIONS.each do |combination|
  if combination1 = @board[combination[0]] == "X" && @board[combination[1]] == "X" && @board[combination[2]] == "X" ||
     combination2 = @board[combination[0]] == "O" && @board[combination[1]] == "O" && @board[combination[2]] == "O"
    return false
  end
 end
end

#over
def over?
  WIN_COMBINATIONS.each do |combination|
    if combination1 = @board[combination[0]] == "X" && @board[combination[1]] == "X" && @board[combination[2]] == "X" ||
       combination2 = @board[combination[0]] == "O" && @board[combination[1]] == "O" && @board[combination[2]] == "O"
      return true
    end
  end
  draw = full?
     if draw == true
      return true
     else
      return false
     end
   end

   #winner
  def winner
       no_combinations = true
     WIN_COMBINATIONS.each do |combination|
       if combination1 = @board[combination[0]] == "X" && @board[combination[1]] == "X" && @board[combination[2]] == "X"
           no_combinations = false
         return "X"
       elsif combination2 = @board[combination[0]] == "O" && @board[combination[1]] == "O" && @board[combination[2]] == "O"
            no_combinations = false
         return "O"
       end
     end
      if no_combinations == true
       return nil
      end
     end

     #current_player
     def current_player
       turn_count % 2 == 0 ? "X" : "O"
     end

     #turn_count
 def turn_count
       @board.count{|token| token == "X" || token == "O"}
 end

 def play
 end
<<<<<<< HEAD

=======
     
>>>>>>> 455d172b41701f84dc1a119be5007c63c1efeeaa
end
