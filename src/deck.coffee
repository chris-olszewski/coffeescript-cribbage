if typeof module != "undefined" && module.exports
	Card = require 'card.coffee'
else
	Card = window.Card

class window.Deck
	constructor: ->
		# creates new deck in order
		@cards = []

		for suit in ['d', 'h', 's', 'c']
			for num in [1..13]
				@cards.push new Card suit, num
		# shuffle new deck
		@shuffle()

	shuffle: ->
		for i in [@cards.length-1..1]
			j = Math.floor Math.random() * (i + 1)
			[@cards[i], @cards[j]] = [@cards[j], @cards[i]]

	draw: ->
		card = @cards[0]
		@cards.splice 0, 1
		card

if typeof module != "undefined" && module.exports
	# Run from CLI (for tests)
	module.exports = Deck
else
	# Run from browser
	window.Deck = Deck
