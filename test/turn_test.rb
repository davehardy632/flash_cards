require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test


  def test_card_and_turn_exist
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert_instance_of Card, card
    assert_instance_of Turn, turn
  end

  def test_turn_has_card
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal card, turn.card
  end

  def test_does_guess_get_returned
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal "Juneau", turn.guess
  end

  def test_if_guess_is_correct
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal true, turn.correct?
  end

  def test_does_method_return_feedback
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal "Correct!", turn.feedback
  end

  def test_new_card_and_turn_exist
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    assert_instance_of Card, card
    assert_instance_of Turn, turn
  end

  def test_new_turn_has_card
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    assert_equal card, turn.card
  end

  def test_that_incorrect_guess_is_returned
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    assert_equal "Saturn", turn.guess
  end

  def test_that_incorrest_guess_returns_false
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    assert_equal false, turn.correct?
  end

  def test_that_feedback_returns_incorrect
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    assert_equal "Incorrect", turn.feedback
  end
end
