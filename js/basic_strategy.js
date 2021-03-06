// Generated by CoffeeScript 1.3.3
(function() {
  var AI, Basic_Strategy, Helper, Logger, root,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  AI = require('./ai').AI;

  Logger = require('./logger');

  Helper = require('./helper');

  Basic_Strategy = (function(_super) {

    __extends(Basic_Strategy, _super);

    function Basic_Strategy() {
      Basic_Strategy.__super__.constructor.call(this);
    }

    Basic_Strategy.prototype.defence = function(ball) {
      var estimatedVector, firstVector, ownSidePrediction;
      Logger.log("AI", "defence");
      firstVector = this.predictFirstPosition(ball);
      estimatedVector = this.estimateNewDirection(firstVector);
      ownSidePrediction = this.predictSideCollision(estimatedVector);
      return {
        y: ownSidePrediction.y,
        hit: 'center'
      };
    };

    Basic_Strategy.prototype.attack = function(ball) {
      var firstVector;
      Logger.log("AI", "attack");
      firstVector = this.predictFirstPosition(ball);
      return {
        y: firstVector.y,
        hit: 'center'
      };
    };

    Basic_Strategy.prototype.estimateNewDirection = function(vector) {
      var newVector;
      newVector = Helper.clone(vector);
      newVector.dx = -newVector.dx;
      return newVector;
    };

    return Basic_Strategy;

  })(AI);

  root = typeof exports !== "undefined" && exports !== null ? exports : window;

  root.Basic_Strategy = Basic_Strategy;

}).call(this);
