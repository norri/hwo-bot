AI = require('./ai').AI
Logger = require('./logger')
Helper = require('./helper')

class Basic_Strategy extends AI
	constructor: ->
		super()

	defence: (ball) ->
		# ball is moving right
		Logger.log "AI", "defence"

		firstVector = @predictFirstPosition ball
		estimatedVector = @estimateNewDirection firstVector
		ownSidePrediction = @predictSideCollision estimatedVector
		{y:ownSidePrediction.y, hit: 'center'}

	attack: (ball) ->
		# ball is moving left
		Logger.log "AI", "attack"
		firstVector = @predictFirstPosition ball
		{y:firstVector.y, hit: 'center'}

	estimateNewDirection: (vector) ->
 		newVector = Helper.clone vector
 		newVector.dx = -newVector.dx
 		newVector

root = exports ? window
root.Basic_Strategy = Basic_Strategy
