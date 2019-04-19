require './lib/round.rb'
require './lib/deck.rb'
require './lib/card.rb'
require './lib/turn.rb'

class FlashcardRunner

  def initialize
    @card_1 = Card.new("What is 5 + 5?", "10", :STEM)
    @card_2 = Card.new("What is Rachel's favorite animal?", "Cat", :Turing_Staff)
    @card_3 = Card.new("What is Mike's middle name?", "nobody knows", :Turing_Staff)
    @card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :Pop_Culture)

    @cards = [@card_1, @card_2, @card_3, @card_4]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
    @counter = 1
  end

  def run
    puts "Welcome! You're playing with 4 cards.
  -------------------------------------------------"
    puts "This is card number #{@counter} out of 4."
    @cards.each do |card|
      puts "Question: #{card.question}"
      user_guess = gets.chomp
      new_turn = @round.take_turn(user_guess)
      puts @round.turns[0].feedback
    end
    puts "****** Game over! ******"
    puts "You had #{@round.number_correct} correct guesses out of 4 for a total score of #{@round.percent_correct.round}%."
    categories = @cards.map {|x| x.category}.uniq!
    categories.each do |category|
      puts "#{category} - #{@round.percent_correct_by_category(category).round}% correct"
    end
  end
end

FlashcardRunner.new.run