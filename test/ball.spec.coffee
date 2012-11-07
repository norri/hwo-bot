Ball = require('../src/ball').Ball
chai = require 'chai'
expect = chai.expect

describe 'Ball', ->
	ball = null

	beforeEach ->
		ball = new Ball { x: 0, y: 0 }, 5

	it 'default position should be 0,0', ->
		expect(ball.position.x).to.equal 0
		expect(ball.position.y).to.equal 0

		describe 'update', ->

		it 'should update position', ->
			ball.update { x: 1, y: 2}, 1
			expect(ball.position.x).to.equal 1
			expect(ball.position.y).to.equal 2

		it 'should update change vectors', ->
			ball.update { x: 1, y: 2}, 1
			expect(ball.dx).to.equal 1
			expect(ball.dy).to.equal 2

		it 'should update speed', ->
			ball.update { x: 1, y: 0}, 1
			expect(ball.speed).to.equal 1
			ball.update { x: 3, y: 0}, 1
			expect(ball.speed).to.equal 2


		