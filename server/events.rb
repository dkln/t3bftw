class Events < Model

  attr_accessor :sender, :game

  def sync_players
    sender.broadcast('syncPlayers', players: game.players)
  end

end
