require './lib/round.rb'
require './lib/deck.rb'
require './lib/card.rb'
require './lib/turn.rb'
require './lib/card_generator.rb'

class FlashcardRunner

  def initialize
    @generator = CardGenerator.new("./lib/cards.txt")
    @cards = @generator.cards
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def start
    welcome_message
    question_guesser
    game_over
  end

  def welcome_message
    puts "Welcome! You're playing with 4 cards.
-------------------------------------------------"
  end

  def game_over
    puts "****** Game over! ******"
    puts "You had #{@round.number_correct} correct guesses out of 4 for a total score of #{@round.percent_correct.round}%."
    categories_score_summary
  end

  def categories_score_summary
    categories = @cards.map {|x| x.category}.uniq!
    categories.each do |category|
      puts "#{category} - #{@round.percent_correct_by_category(category).round}% correct"
    end
  end

  def question_guesser
    @cards.each_with_index do |card, index|
      puts "This is card number #{index + 1} out of 4."
      puts "Question: #{card.question}"
      user_guess = gets.chomp
      new_turn = @round.take_turn(user_guess)
      puts @round.turns[0].feedback
    end
  end
end

FlashcardRunner.new.start