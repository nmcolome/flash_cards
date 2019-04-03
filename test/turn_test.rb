require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn.rb'
require './lib/card.rb'

class TurnTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_it_has_a_guess
    assert_equal "Juneau", @turn.guess
  end

  def test_it_has_a_card
    assert_equal @card, @turn.card
  end

  def test_it_returns_correct_boolean
    other_answer = Turn.new("Washington", @card)

    assert @turn.correct?
    refute other_answer.correct?
  end

  def test_it_has_feedback
    other_answer = Turn.new("Washington", @card)

    assert_equal "Correct!", @turn.feedback
    assert_equal "Incorrect.", other_answer.feedback
  end
end