AI = require('./ai')
AI_Selector = require('./ai_selector').AI_Selector
Court = require('./court').Court
Ball = require('./ball').Ball
Paddle = require('./paddle').Paddle
Opponent = require('./opponent').Opponent
Logger = require('./logger')

class Game
	constructor: (@strategy = 'advanced') ->
		@time = 0

	init: (data) ->
		conf = data.conf
		@court = Court.getInstance conf.maxWidth, conf.maxHeight, conf.ballRadius
		@ball = new Ball data.ball.pos, conf.ballRadius
		@paddle = new Paddle data.left.y, data.conf.paddleWidth, conf.paddleHeight
		@opponent = new Opponent data.right.y, data.conf.paddleWidth, conf.paddleHeight

		selector = new AI_Selector
		@ai = selector.select @strategy
		Logger.log "Game", "selected strategy: #{@strategy}"

	update: (data) ->
		# Initialize game when first message arrives
		if @time is 0
			@init data
			@time = data.time
			return {updateDirection: false}

		dt = data.time - @time
		@time = data.time
		if dt is 0
			return {updateDirection: false}

		@ball.update { x: data.ball.pos.x, y: data.ball.pos.y }, dt
		@paddle.update data.left.y, dt
		Logger.log "Game", "Paddle moving to: #{@paddle.direction}"
		@opponent.update data.right.y
		prediction = @predict @ball, @opponent
		Logger.log "Game", "Prediction: #{prediction.y}"

		@makeMove prediction	

	predict: (ball, opponent) ->
		if ball.dx > 0
			@ai.defence ball, opponent
		else if ball.dx < 0
			@ai.attack ball, opponent

	makeMove: (prediction) ->
		if @_isNearLimits prediction
			Logger.log "Game", "move to center (in limits): #{prediction.y}"
			return @paddle.moveToCenter prediction.y

		switch prediction.hit
			when 'up'
				Logger.log "Game", "move to up: #{prediction.y}"
				@paddle.moveToUpper prediction.y
			when 'down'
				Logger.log "Game", "move to down: #{prediction.y}"
				@paddle.moveToLower prediction.y
			else 
				Logger.log "Game", "move to center: #{prediction.y}"
				@paddle.moveToCenter prediction.y

	_isNearLimits: (prediction) ->
		(prediction.y < @court.top + @paddle.height) or (prediction.y > @court.bottom - @paddle.height)


root = exports ? window
root.Game = Game
