Array::filter = (callback) ->
	element for element in this when callback(element)

Array::unique = ->
	output = {}
	output[@[key]] = @[key] for key in [0...@length]
	value for key, value of output

if typeof module != "undefined" && module.exports
	# Run from CLI (for tests)
	module.exports = Array
