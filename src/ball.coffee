class Ball
	constructor: (@position, @radius) ->
		@speed = 0
		@dx = 0
		@dy = 0
	
	update: (newPosition, dt) ->
		@dx = newPosition.x - @position.x
		@dy = newPosition.y - @position.y
		@position = newPosition
		@speed = @dx / dt

root = exports ? window
root.Ball = Ball

