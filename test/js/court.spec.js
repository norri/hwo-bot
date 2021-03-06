// Generated by CoffeeScript 1.3.3
(function() {
  var Court, chai, expect;

  Court = require('../src/court').Court;

  chai = require('chai');

  expect = chai.expect;

  describe('Court', function() {
    var court;
    court = null;
    beforeEach(function() {
      return court = new Court(200, 100, 5);
    });
    it('left value should be 0', function() {
      return expect(court.left).to.equal(0);
    });
    it('right value should equal to width', function() {
      return expect(court.right).to.equal(200);
    });
    it('bottom value should equal to height', function() {
      return expect(court.bottom).to.equal(100);
    });
    it('top value should be 0', function() {
      return expect(court.top).to.equal(0);
    });
    it('third attribute should be ball radius', function() {
      return expect(court.ballRadius).to.equal(5);
    });
    return describe('collision', function() {
      it('vector should collide to left wall if going left and on right side of the wall', function() {
        var result;
        result = court.collisionOnLeft({
          x: 40,
          dx: -5
        });
        expect(result).to.equal(true);
        result = court.collisionOnLeft({
          x: 40,
          dx: 5
        });
        expect(result).to.equal(false);
        result = court.collisionOnLeft({
          x: -40,
          dx: 5
        });
        return expect(result).to.equal(false);
      });
      return it('vector should collide to right wall if going left and on left side of the wall', function() {
        var result;
        result = court.collisionOnRight({
          x: 40,
          dx: 5
        });
        expect(result).to.equal(true);
        result = court.collisionOnRight({
          x: 40,
          dx: -5
        });
        expect(result).to.equal(false);
        result = court.collisionOnRight({
          x: 240,
          dx: 5
        });
        return expect(result).to.equal(false);
      });
    });
  });

}).call(this);
