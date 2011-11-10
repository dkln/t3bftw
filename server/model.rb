class Model

  def initialize(attrs = {})
    attrs.each { |k, v| send(:"#{k}=", v) }
  end

end
