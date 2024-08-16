class Node
  attr_accessor :moves, :value

  def initialize(value)
    @value = value
    @moves = []
  end
end
