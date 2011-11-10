require 'rubygems'
require 'bundler/setup'
require 'em-websocket'
require 'json'

require './game'
require './model'
require './player'
require './sender'
require './receiver'
require './events'

game      = Game.new
receiver  = Receiver.new(game)

EventMachine.run do
  EventMachine::WebSocket.start(host: '0.0.0.0', port: 8080) do |socket|
    socket.onopen do
      puts "Socket opened"
      game.join!(socket)
    end

    socket.onmessage do |message|
      receiver.receive(socket, message)
    end

    socket.onclose do
      puts "Socket closed"
      game.leave!(socket)
    end
  end
end
