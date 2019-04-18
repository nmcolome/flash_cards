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
    @turns.count { |turn| turn.correct? }
  end

  def number_correct_by_category(category_name)
    @turns.count { |turn| turn.correct? && turn.card.category == category_name}
  end
end