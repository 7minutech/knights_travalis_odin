class Graph
  attr_accessor :coords, :nodes

  def initialize
    @coords = []
    @nodes = []
    build_coords
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
      current_node.nodes = possible_moves
      @nodes.push(current_node)
    end
  end

  def possible_moves(row, col)
    moves = []
    moves.push([row - 2, row + 1])
    moves.push([row - 2, row - 1])
    moves.push([row + 2, row + 1])
    moves.push([row + 2, row - 1])
    moves.push([col - 2, col + 1])
    moves.push([col - 2, col - 1])
    moves.push([col + 2, col + 1])
    moves.push([col + 2, col - 1])
    moves
  end

  def remove_impossible_moves(moves)
    moves.filter { |move| move.max < 8 && move.min > -1 }
  end
end
