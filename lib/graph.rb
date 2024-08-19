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

  def knight_moves(start, final, queue = [], all_paths = [])
    if start.is_a?(Array)
      start = find_node(start)
      queue.push([start, [start.value]])
    end

    until queue.empty?
      checked, current_path = queue.shift

      if checked.value == final
        all_paths.push(current_path)
      else
        checked.visited = true

        checked.moves.each do |node|
          node_obj = find_node(node)
          queue.push([node_obj, current_path + [node_obj.value]]) unless node_obj.nil? || node_obj.visited
        end
      end
    end

    display_best_paths(all_paths)
  end

  def display_best_paths(paths)
    return if paths.empty?

    min_length = paths.map(&:length).min
    best_paths = paths.select { |path| path.length == min_length }

    puts "Best Paths:"
    best_paths.each do |path|
      puts path.inspect
    end
  end
end
