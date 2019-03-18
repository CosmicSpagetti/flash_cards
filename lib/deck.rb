

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    output = []
    i = 0
    while i < @cards.count do
      if @cards[i].category == category
        output << @cards[i]
      end
      i += 1
    end
    output
  end
end
