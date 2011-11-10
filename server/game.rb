class Game
  def join!(socket)
    player = Player.new(id: players.size, name: "Player #{players.size + 1}", socket: socket)
    players << player
    sockets[socket] = player

    events.sync_players
  end

  def leave!(socket)
    players.delete_if { |player| player.socket == socket }
    sockets.delete(socket)

    events.sync_players
  end

  def players
    @players ||= []
  end

  def sockets
    @sockets ||= {}
  end

  def sender
    @sender ||= Sender.new(players)
  end

  def events
    @events ||= Events.new(sender: sender, game: self)
  end

end
