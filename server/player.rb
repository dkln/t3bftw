class Player < Model

  attr_accessor :id, :name, :score, :socket

  def to_json(*args)
    { id: id,
      name: name,
      score: score }.to_json(*args)
  end

end
