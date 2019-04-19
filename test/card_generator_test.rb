require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator.rb'

class CardGeneratorTest < Minitest::Test
  def test_it_exists
    generator = CardGenerator.new

    assert_instance_of CardGenerator, generator
  end
end