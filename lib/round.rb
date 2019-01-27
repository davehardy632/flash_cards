class Round
  attr_reader :deck
  def initialize(deck)
    @deck = deck
  end

  def turns
    []
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guess)
    



end
