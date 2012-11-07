class Paddle
  constructor: (@y, @width, @height) ->
    @direction = 0.0
    @maxSpeed = 15 # Default value

  update: (newY, dt) ->
    @updateMaxSpeed newY - @y, dt
    @y = newY

  updateMaxSpeed: (dy, dt) ->
    speed = Math.abs(dy / dt)
    @maxSpeed = speed if speed > @maxSpeed

  moveToUpper: (newY) ->
    unless newY
      @changeDirection false
    stopCondition = @y < newY < @y + @height / 2
    updateDirection = @getDirection newY, stopCondition
    @changeDirection updateDirection

  moveToLower: (newY) ->
    unless newY
      @changeDirection false
    stopCondition = @y + @height / 2 < newY < @y + @height
    updateDirection = @getDirection newY, stopCondition
    @changeDirection updateDirection

  moveToCenter: (newY) ->
    unless newY
      @changeDirection false
    stopCondition = @y <= newY <= @y + @height
    console.log "moveToCenter: #{stopCondition}"
    updateDirection = @getDirection newY, stopCondition
    @changeDirection updateDirection

  getDirection: (newY, stopCondition) ->
    updateDirection = false
    if stopCondition and not @stopped()
      @stop()
      updateDirection = true
    else if newY < @y and not @movingUp()
      @moveUp()
      updateDirection = true
    else if newY > @y + @height and not @movingDown()
      @moveDown()
      updateDirection = true
    updateDirection

  maxMoveDistance: (time) ->
    @maxSpeed * time

  movingDown: ->
    @direction > 0.0

  movingUp: ->
    @direction < 0.0

  stopped: ->
    @direction is 0.0

  moveUp: ->
    @direction = -1.0

  moveDown: ->
    @direction = 1.0

  stop: ->
    @direction = 0.0

  changeDirection: (b) ->
    {updateDirection: b, direction: @direction}

root = exports ? window
root.Paddle = Paddle


