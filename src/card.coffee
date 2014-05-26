class Card
	constructor: (suit, number) ->
		# Creates card with both a suit and a number
		@number = number if 1 <= number <= 13
		@suit = suit if suit is 'd' or suit is 'h' or suit is 's' or suit is 'c'
		@val = number unless number > 10
		@val or= 10

	suit_name: ->
		switch @suit
			when 'd'
				'Diamonds'
			when 'h'
				'Hearts'
			when 's'
				'Spades'
			when 'c'
				'Clubs'

	number_char: ->
		switch @number
			when 1
				"A"
			when 11
				"J"
			when 12
				"Q"
			when 13
				"K"
			else
				@number.toString()

	name: ->
		"#{@number_char()} of #{@suit_name()}"

if typeof module != "undefined" && module.exports
	# Run from CLI (for tests)
	module.exports = Card
else
	# Run from browser
	window.Card = Card
