Array::filter = (callback) ->
	element for element in this when callback(element)

Array::unique = ->
	output = {}
	output[@[key]] = @[key] for key in [0...@length]
	value for key, value of output

arrayEqual = (a, b) ->
	a.length is b.length and a.every (elem, i) -> elem.suit is b[i].suit and elem.number is b[i].number

if typeof module != "undefined" && module.exports
	# Run from CLI (for tests)
	module.exports = Array
	# module.exports.arrayEqual = arrayEqual
else
	window.Array = Array
	# window.arrayEqual = arrayEqual
