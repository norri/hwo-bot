AI = require('./ai').AI
Helper = require('./helper')
Logger = require('./logger')

class Advanced_Strategy extends AI
	constructor: ->
		super()

	defence: (ball, opponent) ->
		# ball is moving right
		Logger.log "AI", "defence"
		firstVector = @predictFirstPosition ball
		estimatedVector = @estimateDirectionBack firstVector, opponent
		ownSidePrediction = @predictSideCollision estimatedVector
		{y:ownSidePrediction.y, hit: 'center'}

	estimateDirectionBack: (vector, opponent) ->
		factor = 1.0
		newVector = Helper.clone vector
		if @_ballIsMovingDownBeforeCollision vector
		  	if @_opponentIsHigherThanBall opponent, vector then factor = 1.2
		  	else if @_opponentIsLowerThanBall opponent, vector then factor = 0.8
		else if @_ballIsMovingUpBeforCollision vector
		  	if @_opponentIsHigherThanBall opponent, vector then factor = 0.8
		  	else if @_opponentIsLowerThanBall opponent, vector then factor = 1.2
		newVector.dx = -newVector.dx
		newVector.dy = factor * newVector.dy
		newVector

	_ballIsMovingDownBeforeCollision: (vector) ->
		vector.dy > 0

	_ballIsMovingUpBeforCollision: (vector) ->
		vector.dy < 0

	_opponentIsHigherThanBall: (opponent, vector) ->
		(opponent.y + opponent.height) < vector.y

	_opponentIsLowerThanBall: (opponent, vector) ->
		opponent.y > vector.y

	attack: (ball, opponent) ->
		# ball is moving left
		Logger.log "AI", "attack"
		firstVector = @predictFirstPosition ball
		hitCoordinateEstimations = @calculateHits firstVector
		factor = @selectBestFactorForHit hitCoordinateEstimations, opponent
		Logger.log "AI", "factor: #{factor}"

		hitDirection = 'center'
		if factor < 1 and firstVector.dy > 0
			hitDirection = 'up'
		else if factor < 1 and firstVector.dy < 0
			hitDirection = 'down'
		else if factor > 1 and firstVector.dy > 0
			hitDirection = 'down'
		else if factor > 1 and firstVector.dy < 0
			hitDirection = 'up'
		{y: firstVector.y, hit: hitDirection}

	calculateHits: (vector) ->
 		estimations = [0.8, 1.0, 1.2]
 		results = []
 		for factor, index in estimations
 			newVector = @estimateNewAttackDirection vector, factor
 			hitEstimateVector = @predictSideCollision newVector
 			results[index] = {y: hitEstimateVector.y, factor: factor}
 		results

	estimateNewAttackDirection: (vector, factor) ->
 		newVector = Helper.clone vector
 		newVector.dx = -newVector.dx
 		newVector.dy = factor * newVector.dy
 		newVector

 	selectBestFactorForHit: (hitEstimations, opponent) ->
 		maxDistance = 0
 		factor = 1.0
 		for estimate in hitEstimations
 			distanceFromOpponent = Math.abs(estimate.y - opponent.y + opponent.height / 2)
 			Logger.log "AI", "Estimate: #{estimate.y}, factor: #{estimate.factor}, distance from opponent: #{distanceFromOpponent}"
 			if distanceFromOpponent > maxDistance
 				maxDistance = distanceFromOpponent
 				factor = estimate.factor
 		factor


root = exports ? window
root.Advanced_Strategy = Advanced_Strategy
