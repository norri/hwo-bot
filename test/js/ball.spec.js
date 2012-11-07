// Generated by CoffeeScript 1.3.3
(function() {
  var Ball, chai, expect;

  Ball = require('../src/ball').Ball;

  chai = require('chai');

  expect = chai.expect;

  describe('Ball', function() {
    var ball;
    ball = null;
    beforeEach(function() {
      return ball = new Ball({
        x: 0,
        y: 0
      }, 5);
    });
    return it('default position should be 0,0', function() {
      expect(ball.position.x).to.equal(0);
      expect(ball.position.y).to.equal(0);
      describe('update', function() {});
      it('should update position', function() {
        ball.update({
          x: 1,
          y: 2
        }, 1);
        expect(ball.position.x).to.equal(1);
        return expect(ball.position.y).to.equal(2);
      });
      it('should update change vectors', function() {
        ball.update({
          x: 1,
          y: 2
        }, 1);
        expect(ball.dx).to.equal(1);
        return expect(ball.dy).to.equal(2);
      });
      return it('should update speed', function() {
        ball.update({
          x: 1,
          y: 0
        }, 1);
        expect(ball.speed).to.equal(1);
        ball.update({
          x: 3,
          y: 0
        }, 1);
        return expect(ball.speed).to.equal(2);
      });
    });
  });

}).call(this);