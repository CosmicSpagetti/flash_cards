require './lib/turn'
class Round
attr_reader :deck, :turns, :number_correct, :correct_cards
  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = 0
    @number_correct = 0
    @correct_cards = []
  end

  def current_card
    @deck.cards[@current_card]
  end

  def take_turn(guess)
    take_turn = Turn.new(guess, current_card)
    @turns << take_turn
    @current_card += 1
    if @turns.last.correct? == true
      @number_correct += 1
      @correct_cards << take_turn
    end
    return take_turn
  end

  def number_correct_by_category(category)
    correct_by_category = @correct_cards.select{|cards| cards.card.category == category}.count
  end

  def percent_correct
  (@number_correct.fdiv(@turns.count)) * 100.0
  end

  def percent_correct_by_category(category)
    number_correct_by_category(category).fdiv(@turns.select{|cards| cards.card.category == category}.count) * 100.0
  end

  def question_and_answer_feedback
    p "This is card #{turns.count + 1} out of #{deck.count} "
    p "Question : #{current_card.question}"
    take_turn(gets.chomp).feedback
  end

  def start
    p "Hello we gonna play a game. I got #{deck.count} cards with questions for ya"
    p "Lets play!"
    p ("-") * 75

    (deck.count).times{question_and_answer_feedback}

    p "*" * 8 + "Game over!" + "*" * 8

    p "You have #{number_correct} correct guess out of #{deck.count} for a total of #{percent_correct}%."


    categories = turns.map{|cards| cards.card.category}.uniq
    categories.each{|x| p "#{x}  -  #{percent_correct_by_category(x)}%"}

  end
end
