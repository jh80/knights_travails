# frozen_string_literal: true

# Vertex objects for implicit graph
class Vertex
  attr_reader :place, :size, :edges
  @@moves = [[-1, -2], [-2, -1], [1, -2], [-2, 1], [-1, 2], [2, -1], [1, 2], [2, 1]]
  def initialize(x, y, size = 8)
    @place = [x,y]
    @size = size
    @edges = find_edges
  end

  def find_edges
    edges = []
    @@moves.each do |move|
      edge = [@place[0] + move[0], @place[1] + move[1]]
      next if edge.any? { |n| n < 0 || n > (size - 1)}
      edges << edge
    end
    edges
  end
end