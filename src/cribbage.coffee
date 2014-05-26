if typeof module != "undefined" && module.exports
	Array = require '../src/utilities'

class Cribbage
	constructor: ->
		# creates new cribbage game

	@points: (cards) ->
		# calculates points from the array of cards given (assumes last card given is card flipped)
		total = 0

		# check for pairs
		total += @_pairs(cards)

		# check for runs

		# check for 15s
		total += @_fifteen(cards)

		# check for same suit
		total += @_flush(cards)

		# check for knobs
		total += @_knobs(cards)

	@_pairs: (cards) ->
		# counts points from pairs
		total = 0
		cards_copy = cards
		for card in cards_copy.unique()
			temp = cards.filter (x) -> x.number == card.number
			switch temp.length
				when 2 then total += 2
				when 3 then total += 6
				when 4 then total += 12
				else total += 0
		total

	@_runs: (cards) ->
		# counts points from runs
		total = 0
		sorted = cards.sort (a, b) ->
			if a.number <= b.number then 1 else -1

	@_fifteen: (cards) ->
		# points from 15s
		combos = []
		for card in cards
			combo = [card]
			combo.push card2 for card2 in cards when combo.reduce (x, y) -> x.val + y.val <= 15 - card2.val
			combos.push combo if combo.reduce (x, y) -> x.val + y.val is 15
		console.log combos
		combos.length * 2


	@_knobs: (cards) ->  # works
		# calculates knobs
		unless cards.length is 5 then return 0
		[hand..., flipped] = cards
		if (card for card in hand when card.number is 11 and card.suit is flipped.suit).length > 0 then 1 else 0

	@_flush: (cards) ->
		# finds flush
		points = 0
		if cards[0].suit is cards[1].suit is cards[2].suit is cards[3].suit then points += 4
		if cards.length is 5 and cards[0].suit is cards[4].suit then points++
		points

if typeof module != "undefined" && module.exports
	# Run from CLI (for tests)
	module.exports = Cribbage
else
	# Run from browser
	window.Cribbage = Cribbage
