class Graph
  attr_accessor :coords

  def initialize
    @coords = []
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
  end
end
