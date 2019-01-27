require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class TurnTest < Minitest::Test

def test_if_deck_exists
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

  cards = [card_1, card_2, card_3]

  deck = Deck.new(cards)

  assert_instance_of Deck, deck
end

def test_that_cards_in_deck_are_returned
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

  cards = [card_1, card_2, card_3]

  deck = Deck.new(cards)

  assert_equal cards, deck.cards
end

def test_number_of_cards

  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

  cards = [card_1, card_2, card_3]

  deck = Deck.new(cards)

  assert_equal 3, deck.count
end

def test_if_deck_returns_cards_from_category

  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

  cards = [card_1, card_2, card_3]

  deck = Deck.new(cards)

  assert_equal  [card_2, card_3], deck.cards_in_category(:STEM)

  assert_equal [card_1], deck.cards_in_category(:Geography)

  assert_equal [], deck.cards_in_category("Pop Culture")
end
end
