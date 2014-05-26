Card = require '../src/card'

exports.CardTest = 

	'a jack should be worth 10': (test) ->
		card = new Card 'h', 11
		test.equal card.val, 10
		test.done()

	