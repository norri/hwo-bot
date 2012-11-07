Opponent = require('../src/opponent').Opponent
chai = require 'chai'
expect = chai.expect

describe 'Opponent', ->
	opponent = new Opponent 0

	it 'constructing should store position', ->
		expect(opponent.y).to.equal 0

	it 'should update value of y', ->
		opponent.update 5
		expect(opponent.y).to.equal 5