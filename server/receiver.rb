class Receiver

  attr_accessor :game

  def initialize(game)
    self.game = game
  end

  def receive(socket, json)
    player = game.sockets[socket]
    message = JSON.parse(json)
  end

end
