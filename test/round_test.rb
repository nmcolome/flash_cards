require 'minitest/autorun'
require 'minitest/pride'
require './lib/round.rb'
require './lib/deck.rb'
require './lib/card.rb'
require './lib/turn.rb'

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_it_has_decks
    assert_equal @deck, @round.deck
  end

  def test_it_has_turns
    assert_equal [], @round.turns

    new_turn = @round.take_turn("Juneau")
    assert_equal [new_turn], @round.turns
  end

  def test_it_has_a_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_it_has_a_take_turn
    new_turn = @round.take_turn("Juneau")

    assert_instance_of Turn, new_turn
    assert_equal @card_1, new_turn.card
    assert_equal "Juneau", new_turn.guess
    assert new_turn.correct?
  end

  def test_it_returns_the_number_of_correct_guesses
    assert_equal 0, @round.number_correct

    new_turn = @round.take_turn("Juneau")

    assert_equal 1, @round.number_correct
  end

  def test_changes_card_after_each_guess
    assert_equal @card_1, @round.current_card

    new_turn = @round.take_turn("Juneau")
    assert_equal @card_2, @round.current_card
  end
end