class Singleton
    @_instance: null

    @getInstance: ->
      @_instance ?= new @ arguments...

class Court extends Singleton
  constructor: (width, height, @ballRadius) ->
    @left= 0.0
    @right = width
    @top = 0.0
    @bottom = height

  insideCourt: (vector) ->
    @collisionOnLeft(vector) or @collisionOnRight(vector)

  collisionOnLeft: (vector) ->
    vector.x > @left + @ballRadius and vector.dx < 0

  collisionOnRight: (vector) ->
    vector.x < @right - @ballRadius and vector.dx > 0

  leftWall: ->
    coordinates = [
      {x: @left + @ballRadius, y: @bottom - @ballRadius}
      {x: @left + @ballRadius, y: @top + @ballRadius}
    ]
    coordinates

  rightWall: ->
    coordinates = [
      {x: @right - @ballRadius, y: @bottom - @ballRadius},
      {x: @right - @ballRadius, y: @top + @ballRadius}
    ]
    coordinates

  topWall: ->
    coordinates = [
      {x: @left + @ballRadius, y: @top + @ballRadius},
      {x: @right - @ballRadius, y: @top + @ballRadius}
    ]
    coordinates

  bottomWall: ->
    coordinates = [
      {x: @left + @ballRadius, y: @bottom - @ballRadius},
      {x: @right - @ballRadius, y: @bottom - @ballRadius}
    ]
    coordinates

root = exports ? this
root.Court = Court