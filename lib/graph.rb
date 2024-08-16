require_relative "node"
class Graph
  attr_accessor :coords, :nodes

  def initialize
    @coords = []
    @nodes = []
    build_coords
    build_graph
  end

  def build_coords
    (0..7).each do |x|
      (0..7).each do |y|
        @coords.push([x, y])
      end
    end
  end

  def build_graph
    @coords.each do |coord|
      x = coord[0]
      y = coord[1]
      current_node = Node.new(coord)
      possible_moves = remove_impossible_moves(possible_moves(x, y))
      current_node.moves = possible_moves
      @nodes.push(current_node)
    end
  end

  def possible_moves(row, col)
    moves = []
    moves.push([row - 2, row + 1])
    moves.push([row - 2, row - 1])
    moves.push([row + 2, row + 1])
    moves.push([row + 2, row - 1])
    moves.push([col - 1, col + 2])
    moves.push([col - 1, col - 2])
    moves.push([col + 1, col + 2])
    moves.push([col + 1, col - 2])
    moves
  end

  def remove_impossible_moves(moves)
    moves.filter { |move| move.max < 8 && move.min > -1 }
  end
end
