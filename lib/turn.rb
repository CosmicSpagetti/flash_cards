class Turn
  attr_reader :guess, :card
  def initialize(string, card)
    @guess = string
    @card = card
  end

  def correct?
    @guess == @card.answer
  end

  def feedback
    if correct? == true
      p "Correct!"
    else
      p "Incorrect."
    end
  end
end
