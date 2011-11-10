class Sender

  attr_accessor :players

  def initialize(players)
    self.players = players
  end

  def emit(player, action, message = {})
    json = JSON.generate(action: action, args: message)
    player.socket.send(json)
  end

  def broadcast(action, message = {})
    players.each { |player| emit(player, action, message) }
  end

end
