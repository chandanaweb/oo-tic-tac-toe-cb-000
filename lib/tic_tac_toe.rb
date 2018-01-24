class TicTacToe
  #intialize
  def initialize
      @board =[" "," "," "," "," "," "," "," "," "]
  end

  #  WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  # Helper Method
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts"-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts"-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # input_to_index , This method takes the user_input (which is a string), converts it to an Integer, and subtracts 1
  def input_to_index(num)
    return num.to_i - 1
  end

  #move accepts index and player's character. places the  player's character at provided index
  def move(index,token)
   return @board[index] = token
  end

  #valid_move method accepts an index to check and returns true if the move is valid
  def valid_move?(index)
    if index < 9 && index > -1 && @board[index] != 'X' && @board[index] != 'O'
      return true
    else
      return false
    end
  end


  #Convert user input to an index
  #If the move is valid, make the move and display board.
  #Otherwise ask for a new position until a valid move is received.
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    is_valid = valid_move?(index)
    if is_valid === true
      current_turn = current_player
      move(index,current_turn)
      display_board
    else
      puts 'Please enter correct input'
      puts "Please enter 1-9:"
      input = gets.strip
    end
  end

  #turn_count method returns the number of turns that have been played
  def turn_count
    count  = 0
    @board.each do |player|
      if player == 'X' || player == 'O'
        count += 1
      end
    end
    return count
  end

  # determine if turn is "X"'s turn or "O"'s.
  def current_player
    turn = turn_count
    if turn%2 == 0
      return "X"
    else
      return 'O'
    end
  end

  # won method should accept a board as an argument and return false/nil if there is no win combination
  #present in the board and return the winning combination indexes as an array if there is a win
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

  #full method return true if every element in the board contains either an "X" or an "O".
  def full?
    any_spaces =  @board.any?{|element| element == " "}
      if any_spaces == true
        return false
      else
        return true
      end
  end

  #draw? method returns true if the board has not been won and is full and false if the board is not won and the board is not full, and false if the board is won
  def draw?
    incomplete_board = !full?
    is_game_won = won?
      if incomplete_board == true
        return false
      elsif is_game_won.is_a?(Array)
        return false
      else
        return true
      end
  end

  #over? returns true if the board has been won, is a draw, or is full.
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

  #winner method return the token, "X" or "O" that has won the game given a winning board
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


  #The play method is the main method of the tic tac toe application and is responsible for the game loop. A tic tac toe game must allow players to take turns,
  #checking if the game is over after every turn, and at the conclusion of the game, whether because it was won or because it was a draw,
  #reporting to the user the outcome of the game
  def play
    @board.each do|index|
      is_game_over = over?
      is_game_won = won?
      is_game_draw = draw?
      if is_game_over == true
        if is_game_won.is_a?(Array)
          winner_name = winner
          puts "Congratulations #{winner_name}!"
          return " "
        elsif is_game_draw == true
          puts "Cat\'s Game!"
          return " "
        else
          return false
        end
      else
        if is_game_won.is_a?(Array)
          winner_name = winner
          puts "Congratulations #{winner_name}!"
          return " "
        elsif is_game_draw == true
          puts "Cat\'s Game!"
          return " "
        else
          turn
        end
      end
    end
    turn
  end
end
