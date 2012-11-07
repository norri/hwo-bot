Helper = require('./helper')
Court = require('./court').Court
Logger = require('./logger')

root = exports ? window

class AI
	constructor: ->
		@court = Court.getInstance()
		@multiplier = @court.right * 2

	defence: (ball, opponent) ->

	attack: (ball, opponent) ->

	predictFirstPosition: (ball) ->
		vector = { x: ball.position.x, y: ball.position.y, dx: ball.dx, dy: ball.dy }
		@predictSideCollision vector

	predictSideCollision: (vector) ->
		tries = 0
		while @court.insideCourt(vector) and (tries < 10)
			vector = @predict vector
			tries++
		Helper.clone vector

	predict: (vector) ->
		point0 = { x: vector.x, y: vector.y }
		point1 = { x: vector.x + @multiplier * vector.dx, y: vector.y + @multiplier * vector.dy }

		if vector.dx < 0
			# Left wall, x = 0
			point = Helper.intersectWall(point0, point1, @court.leftWall(), "x")
		else
			# Right wall, x = width
			point = Helper.intersectWall(point0, point1, @court.rightWall(), "x")
		if point is undefined
			if vector.dy < 0
				# Top wall, y = 0
	  		point = Helper.intersectWall(point0, point1, @court.topWall(), "y")
			else
				# Bottom wall, y = height
	  		point = Helper.intersectWall(point0, point1, @court.bottomWall(), "y")
		@newVector point, vector.dx, vector.dy

	newVector: (point, dx, dy) ->
		return unless point
		vector = Helper.clone point
		switch vector.collision
			when "x"
			  	vector.dx = dx
			  	vector.dy = dy
			when "y"
			  	vector.dx = dx
			  	vector.dy = -dy
		vector

	timeToTarget: (ball) ->
		Helper.timeToTarget ball.position.x, ball.speed, @court.right - @court.ballRadius


root = exports ? window
root.AI = AI
