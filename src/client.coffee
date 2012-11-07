Tcp = require('./tcp_client')
Pong = require('./game')
Logger = require('./logger')

class Client extends Tcp.Client
  constructor: (@name, host, port, @opponent, @strategy) ->
    super(host, port)

  onConnect: (socket) ->
    if @opponent is undefined
      @join @name, socket
    else
      @requestDuel @name, @opponent, socket
    @socket = socket

  onDisconnect: ->
    process.exit

  onMessage: (message, socket) ->
    try
      switch message.msgType
        when "joined"
          Logger.log "Client", "Game visualization URL #{message.data}"

        when "gameStarted"
          @game = new Pong.Game @strategy
          Logger.log "Client", "Bring it on #{message.data[1]} !"

        when "gameIsOver"
          winner = message.data
          if winner is @name then Logger.log "Client", "Victory!" else Logger.log "Client", "We lost :("

        when "gameIsOn"
          pos = message.data.ball.pos
          Logger.log "Client", "Time: #{message.data.time}, Ball: (#{pos.x},#{pos.y}), Paddle: #{message.data.left.y}, Opponent: #{message.data.right.y}"
          result = @game.update message.data
          if result
            @makeMove result, socket

        else
          Logger.log "Client", "-- unrecognized message encountered:"
          Logger.log "Client", message
    catch error
      Logger.log "Client", "-- ball hit safety net: #{error}"

  join: (name, socket) ->
    joinGame =
      msgType: "join"
      data: name
    @respond joinGame, socket

  requestDuel: (name, opponent, socket) ->
    Logger.log "Client", "Waiting for opponent #{opponent}"
    duelRequest =
      msgType: "requestDuel"
      data: [name, opponent]
    @respond duelRequest, socket

  makeMove: (result, socket) ->
    if result.updateDirection
      Logger.log "Client", "Changed direction to: #{result.direction}"
      move =
        msgType: "changeDir"
        data: result.direction
      @respond move, socket

if process.argv.length >= 4
  name = process.argv[2]
  host = process.argv[3]
  port = process.argv[4]
  opponent = process.argv[5]
  strategy = process.argv[6]
  new Client name, host, port, opponent, strategy
else
  Logger.log "Usage", "client <name> <host> <port>"

