require_relative "lib/graph"
require_relative "lib/node"

my_graph = Graph.new
example_start = my_graph.find_node([3, 3])
my_graph.knight_moves([0, 0], [7, 7])
