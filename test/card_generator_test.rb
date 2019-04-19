require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator.rb'
require './lib/card.rb'

class CardGeneratorTest < Minitest::Test

  def setup
    @filename = "./lib/cards.txt"
    @generator = CardGenerator.new(@filename)
  end

  def test_it_exists
    assert_instance_of CardGenerator, @generator
  end

  def test_it_has_cards
    cards = @generator.cards

    assert_equal 4, cards.count
    assert_instance_of Card, cards[0]
    assert_equal "What is 5 + 5?", cards[0].question
    assert_equal "10", cards[0].answer
    assert_equal :STEM, cards[0].category
    assert_equal "What cardboard cutout lives at Turing?", cards[3].question
    assert_equal "justin bieber", cards[3].answer
    assert_equal :"Pop Culture", cards[3].category
  end
end