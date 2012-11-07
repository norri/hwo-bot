// Generated by CoffeeScript 1.3.3
(function() {
  var AI, Court, chai, expect;

  AI = require('../src/ai').AI;

  Court = require('../src/court').Court;

  chai = require('chai');

  expect = chai.expect;

  describe('AI', function() {
    var ai;
    ai = void 0;
    beforeEach(function() {
      var court;
      court = Court.getInstance(640, 480, 5);
      return ai = new AI;
    });
    return it('should predict wall collisions', function() {
      var result, vector;
      vector = {
        x: 30,
        y: 50,
        dx: 1,
        dy: 0
      };
      result = ai.predictSideCollision(vector);
      return expect(result.y).to.equal(50);
    });
  });

}).call(this);