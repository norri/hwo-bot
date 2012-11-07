Helper = require('../src/helper')
chai = require 'chai'
expect = chai.expect

describe 'Helper', ->

	it 'should be able to define the intersection of two lines', ->
		point = Helper.intersect { x: 0, y: 0 }, { x: 10, y: 10 }, { x: 0, y: 5 }, { x: 10, y: 5 }
		expect(point.x).to.equal 5
		expect(point.y).to.equal 5

	it 'should calculate balls movement time to wall', ->
		time = Helper.timeToTarget 5, 1, 0
		expect(time).to.equal 5 
