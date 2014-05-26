Card = require "../src/card"
Cribbage = require "../src/cribbage"

exports.CribbageTest = 

	'a hand that adds up to 15 should give 2 points': (test) ->
		hand = [new Card('h', 5), new Card('s', 11)]
		points = Cribbage._fifteen(hand)
		test.equal(points, 2)
		test.done()

	'3 pairs are worth 6': (test) ->
		hand = [new Card('h', 3), new Card('s', 3), new Card('c', 3)]
		points = Cribbage._pairs(hand)
		test.equal(points, 6)
		test.done()

	'4 of the same suit are worth 4': (test) ->
		hand = [new Card('h', 1), new Card('h', 2), new Card('h', 3), new Card('h', 4)]
		points = Cribbage._flush(hand)
		test.equal(points, 4)
		test.done()

	'5 of the same suit are worth 5': (test) ->
		hand = [new Card('h', 1), new Card('h', 2), new Card('h', 3), new Card('h', 4), new Card('h', 5)]
		points = Cribbage._flush hand
		test.equal points, 5
		test.done()
