// Generated by CoffeeScript 1.3.3
(function() {
  var Game, chai, expect;

  Game = require('../src/game').Game;

  chai = require('chai');

  expect = chai.expect;

  describe('Game', function() {
    var exampleData, game;
    game = null;
    exampleData = {
      conf: {
        maxWidth: 640,
        maxHeight: 480,
        paddleHeight: 50,
        paddleWidth: 10,
        ballRadius: 5
      },
      ball: {
        pos: {
          x: 10,
          y: 10
        }
      },
      left: {
        y: 50
      },
      right: {
        y: 60
      },
      time: 1000
    };
    beforeEach(function() {
      return game = new Game;
    });
    it('should not be initialized before update', function() {
      return expect(game.ball).to.not.exist;
    });
    return it('should init on first update', function() {
      game.update(exampleData);
      expect(game.ball).to.exist;
      return expect(game.time).to.equal(1000);
    });
  });

}).call(this);