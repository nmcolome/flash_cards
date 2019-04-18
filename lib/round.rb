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

  def number_correct_by_category(category)
    @turns.count { |turn| turn.correct? && turn.card.category == category}
  end

  def percent_correct
    100.0 * number_correct / @turns.count
  end

  def percent_correct_by_category(category)
    turns_by_cat = @turns.count { |turn| turn.card.category == category}
    100.0 * number_correct_by_category(category) / turns_by_cat
  end
end