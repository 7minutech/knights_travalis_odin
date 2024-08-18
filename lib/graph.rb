require_relative "node"
require "pry-byebug"
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
      binding.pry
      current_node.moves = possible_moves
      @nodes.push(current_node)
    end
  end

  def possible_moves(row, col)
    moves = []
    moves.push([row + 1, col + 2])
    moves.push([row + 1, col - 2])
    moves.push([row - 1, col + 2])
    moves.push([row - 1, col - 2])
    moves.push([row + 2, col + 1])
    moves.push([row + 2, col - 1])
    moves.push([row - 2, col + 1])
    moves.push([row - 2, col - 1])
    binding.pry
    moves
  end

  def remove_impossible_moves(moves)
    moves.filter { |move| move.max < 8 && move.min > -1 }
  end

  def find_node(move)
    @nodes.each do |node|
      return node if move == node.value
    end
    nil
  end

  def find_path(start, final, queue = [])
    return nil if start.nil?
    return start if start == final

    if start.is_a?(Array)
      start = find_node(start)
      queue.push(start)
    end

    checked = queue.shift
    p checked.value

    checked.visited = true

    start.moves.each do |node|
      node_obj = find_node(node)
      queue.push(node_obj) unless node_obj.nil? || node_obj.visited
    end

    find_path(queue.first, final, queue)
  end
end
