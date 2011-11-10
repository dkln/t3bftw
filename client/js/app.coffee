class App
  constructor: ->
    @controller = new Controller()
    @socket = new WebSocket('ws://localhost:8080')
    @socket.onmessage = (data) => @onSocketMessage (data)

  onSocketMessage: (data) ->
    message = $.parseJSON(data.data)
    method  = message.action.substr(0, 1).toUpperCase() + message.action.substr(1)

    @controller["on#{method}"](message.args)


class Controller
  onSyncPlayers: (args) ->
    $('#players').empty()

    for player in args.players
      $('#players').append("<li>#{player.name}</li>")

$ ->
  new App()
