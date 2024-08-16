class Node
  attr_accessor :moves, :value, :visited

  def initialize(value)
    @value = value
    @moves = []
    @visited = false
  end
end
