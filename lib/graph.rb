class Graph
  def initialize
    @nodes = []
  end

  def build_nodes
    (0..7).each do |x|
      (0..7).each do |y|
        nodes.push([x, y])
      end
    end
  end
end
