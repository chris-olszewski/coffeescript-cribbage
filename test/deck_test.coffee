Deck = require '../src/deck'

exports.DeckTest = 

	'a deck has 52 cards': (test) ->
		deck = new Deck()
		test.equal deck.cards.length, 52
		test.done()

	'you can shuffle a deck': (test) ->
		deck = new Deck()
		cards = deck.cards[..2]
		deck.shuffle()
		test.notEqual cards, deck.cards[..2]
		test.done()

	'drawing a card removes that card from the deck': (test) ->
		deck = new Deck()
		card = deck.draw()
		test.equal deck.cards.length, 51
		test.equal deck.cards.indexOf(card), -1
		test.done()

	'can add cards into deck': (test) ->
		deck = new Deck()
		cards = [deck.draw(), deck.draw()]
		test.equal deck.cards.length, 50
		deck.add cards[0], cards[1]
		test.equal deck.cards.length, 52
		test.done()
