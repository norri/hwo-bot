Game = require('../src/game').Game
chai = require 'chai'
expect = chai.expect

describe 'Game', ->
	game = null

	exampleData =
		conf: 
			maxWidth: 640
			maxHeight: 480
			paddleHeight: 50
			paddleWidth: 10
			ballRadius: 5
		ball:
			pos:
				x: 10
				y: 10
		left:
			y: 50
		right:
			y: 60
		time: 1000

	beforeEach ->
		game = new Game

	it 'should not be initialized before update', ->
		expect(game.ball).to.not.exist

	it 'should init on first update', ->
		game.update exampleData
		expect(game.ball).to.exist
		expect(game.time).to.equal 1000