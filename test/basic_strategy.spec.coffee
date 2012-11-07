AI = require('../src/ai').AI
AI_Selector = require('../src/ai_selector').AI_Selector
chai = require 'chai'
expect = chai.expect

describe 'Basic Strategy', ->
	ai = null

	beforeEach ->
		selector = new AI_Selector
		ai = selector.select 'basic'

	it 'should just change x-direction when estimating new direction', ->
		vector = {x: 30, y: 30, dx: -3, dy: 2}
		result = ai.estimateNewDirection vector
		expect(result.dx).to.equal 3