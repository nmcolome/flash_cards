class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @count = 0
  end

  def current_card
    @deck.cards[@count]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns.unshift(new_turn)
    @count += 1
    new_turn
  end

  def number_correct
    if @turns[0] && @turns[0].correct?
      @number_correct += 1
    else
      @number_correct
    end
  end
end