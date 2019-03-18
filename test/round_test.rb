require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require 'pry'

class RoundTest < Minitest::Test

  def test_round_and_deck_exist
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    assert_instance_of Round, round
    assert_equal deck, round.deck

  end

  def test_turns_method
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    assert_equal [], round.turns

  end

  def test_if_current_card_exist
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    assert_equal card_1, round.current_card
  end

  def test_function_take_turn
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    turn = Turn.new("Juneau", card_1)
    new_turn = round.take_turn("Juneau")

    assert_instance_of Turn, round.take_turn("Juneau")
    assert_equal Turn, new_turn.class
    assert_equal true, new_turn.correct?
    assert_equal false, round.take_turn("Venus").correct?
    assert_equal 3, round.turns.count
    assert_equal "Incorrect.", round.turns.last.feedback
  end

  def test_function_number_correct_and_correct_by_category
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    turn = Turn.new("Juneau", card_1)

    assert_instance_of Turn, round.take_turn("Juneau")
    assert_equal 1, round.number_correct
    assert_instance_of Turn, round.take_turn("Mars")
    assert_equal 2, round.number_correct
    assert_instance_of Turn, round.take_turn("North north west")
    assert_equal 3, round.number_correct
    assert_equal 1, round.number_correct_by_category(:Geography)
    assert_equal 2, round.number_correct_by_category(:STEM)
    assert_equal 100.0, round.percent_correct
    assert_equal 100.0, round.percent_correct_by_category(:STEM)
  end

end
