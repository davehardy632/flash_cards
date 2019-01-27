require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/round'

class TurnTest < Minitest::Test

  def test_that_round_exists

  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

  cards = [card_1, card_2, card_3]

  deck = Deck.new(cards)

  round = Round.new(deck)

  assert_instance_of Round, round
end

def test_that_deck_is_initialized
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

  cards = [card_1, card_2, card_3]

  deck = Deck.new(cards)

  round = Round.new(deck)

  assert_equal deck, round.deck
end

def test_that_round_turns_works
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

  cards = [card_1, card_2, card_3]

  deck = Deck.new(cards)

  round = Round.new(deck)

  assert_equal  [], round.turns
end

def test_that_round_returns_first_card
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

  cards = [card_1, card_2, card_3]

  deck = Deck.new(cards)

  round = Round.new(deck)

  assert_equal deck.cards.first, round.current_card
end
def test_that_turn_functions_work
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

  cards = [card_1, card_2, card_3]

  deck = Deck.new(cards)

  round = Round.new(deck)

  new_turn = round.take_turn("Juneau")

  assert_instance_of Turn, new_turn

  assert_equal Turn, new_turn.class

  assert_equal true, new_turn.correct?

  assert_equal card_2, round.current_card



end

end
