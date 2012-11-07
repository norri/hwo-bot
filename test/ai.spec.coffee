AI = require('../src/ai').AI
Court = require('../src/court').Court
chai = require 'chai'
expect = chai.expect

describe 'AI', ->
	ai = undefined

	beforeEach ->
		court = Court.getInstance 640, 480, 5
		ai = new AI

	it 'should predict wall collisions', ->
		vector = {x: 30, y: 50, dx: 1, dy: 0}
		result = ai.predictSideCollision vector
		expect(result.y).to.equal 50
