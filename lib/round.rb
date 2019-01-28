require './lib/card'
require './lib/turn'

class Round
  attr_reader :deck, :turns, :number_correct
  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0

  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.cards.shift
    new_turn
  end

  def number_correct
    @turns.each do |turn|
      turn.correct?
      @number_correct += 1
    end
    @number_correct
  end

  # def number_correct_by_category(category)
  #   @turns.map do |turn|
  #     if turn.card.category == category
  #     end
  # end
end
