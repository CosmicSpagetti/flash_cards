require './lib/round'
require './lib/deck'
require './lib/card'
require 'pry'
require '.lib/card_generator'


card_1 = Card.new("What is the most played FPS right now?", "Apex Legends", :VideoGames)
card_2 = Card.new("What is 2 + 6?", "8", :Math)
card_3 = Card.new("Which video game is Billy currently playing?", "Apex Legends", :VideoGames)
card_4 = Card.new("What is 8 * 8?", "64", :Math)
card_5 = Card.new("What did Billy do instead of coding on Saturday?", "Movies", :Billy)
deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
round = Round.new(deck)

round.start
