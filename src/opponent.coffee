class Opponent
	constructor: (@y, @width, @height) ->

	update: (@y) ->

root = exports ? window
root.Opponent = Opponent
