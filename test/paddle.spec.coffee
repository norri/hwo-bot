Paddle = require('../src/paddle').Paddle
chai = require 'chai'
expect = chai.expect

describe 'Paddle', ->
	paddle = null

	beforeEach ->
		paddle = new Paddle 0, 50, 10

	it 'default y-position should be 0', ->
		expect(paddle.y).to.equal 0

	it 'default direction should be 0', ->
		expect(paddle.direction).to.equal 0

	it 'update should update position', ->
		paddle.update 2, 1
		expect(paddle.y).to.equal 2

	describe 'movement', ->

		it 'should go up if ball is coming upper than paddle', ->
			paddle.update 20, 1
			paddle.moveToCenter 0
			expect(paddle.direction).to.equal -1

		it 'should go down if ball is coming lower than paddle', ->
			paddle.update 5, 1
			paddle.moveToCenter 20
			expect(paddle.direction).to.equal 1
			
		it 'should stop if ball is coming towards paddle', ->
			paddle.update 5, 1
			paddle.moveToCenter 6
			expect(paddle.direction).to.equal 0

	describe 'max speed', ->

		it 'max speed should be 15 as default', ->
			expect(paddle.maxSpeed).to.equal 15

		it 'max speed should be updated if bigger than last one', ->
			paddle.update 20, 1
			expect(paddle.maxSpeed).to.equal 20
			paddle.update 4, 1
			expect(paddle.maxSpeed).to.equal 20


