require 'pry'

class CardGenerator
  def initialize(filename)
    @filename = File.new(filename, "r")
  end

  def cards
    @filename.map do |line|
      elements = line.split(",")
      Card.new(elements[0], elements[1], elements[2].chomp)
    end
  end
end