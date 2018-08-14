require './question'

class Game
  attr_accessor :player1, :player2, :turn, :currentPlayer

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn = 1
    @currentPlayer = nil
  end

  def game_over?
    (@player1.lives == 0) || (@player2.lives == 0)
  end

  def ask_question(currentPlayer, question)
    puts "#{currentPlayer.name}: #{question.question}"
    if gets.chomp.to_i == question.answer
      puts 'YAHOO'
    else
      puts 'NO!'
      currentPlayer.lives -= 1
    end
    if !game_over?
      show_lives
    end
  end

  def show_lives
    puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3 \n"
    puts "----- NEW TURN -----"
  end

  def end_game
    if player2.lives == 0
      puts "#{@player1.name} wins with a score of #{@player1.lives}/3"
    else
      puts "#{@player2.name} wins with a score of #{@player2.lives}/3"
    end
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end

  def start
    while !game_over?
      question = Question.new
      if @turn.odd?
        @currentPlayer = player1
      elsif @turn.even?
        @currentPlayer = player2
      end
      ask_question(@currentPlayer, question)
      @turn += 1
    end
    end_game
  end

end
