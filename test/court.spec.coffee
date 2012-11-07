Court = require('../src/court').Court
chai = require 'chai'
expect = chai.expect

describe 'Court', ->
	court = null

	beforeEach ->
		court = new Court 200, 100, 5

	it 'left value should be 0', ->
		expect(court.left).to.equal 0

	it 'right value should equal to width', ->
		expect(court.right).to.equal 200

	it 'bottom value should equal to height', ->
		expect(court.bottom).to.equal 100

	it 'top value should be 0', ->
		expect(court.top).to.equal 0

	it 'third attribute should be ball radius', ->
		expect(court.ballRadius).to.equal 5

	describe 'collision', ->

		it 'vector should collide to left wall if going left and on right side of the wall', ->
			result = court.collisionOnLeft { x: 40, dx: -5 }
			expect(result).to.equal true
			result = court.collisionOnLeft { x: 40, dx: 5 }
			expect(result).to.equal false
			result = court.collisionOnLeft { x: -40, dx: 5 }
			expect(result).to.equal false

		it 'vector should collide to right wall if going left and on left side of the wall', ->
			result = court.collisionOnRight { x: 40, dx: 5 }
			expect(result).to.equal true
			result = court.collisionOnRight { x: 40, dx: -5 }
			expect(result).to.equal false
			result = court.collisionOnRight { x: 240, dx: 5 }
			expect(result).to.equal false
