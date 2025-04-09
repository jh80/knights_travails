# frozen_string_literal: true

# Vertex objects for implicit graph
class Vertex
  attr_reader :place, :size, :edges
  @@moves = [[-1, -2], [-2, -1], [1, -2], [-2, 1], [-1, 2], [2, -1], [1, 2], [2, 1]]
  def initialize(place, size = 8)
    @place = place
    @size = size
    @edges = find_edges
  end

  def find_edges
    edges = []
    @@moves.each do |move|
      edge = [@place[0] + move[0], @place[1] + move[1]]
      next if invalid?(edge)
      edges << edge
    end
    edges
  end

  def knight_moves(stop, path = @place)
    shortest_path = nil
    edges.each do |edge|
      Vertex.new(edge)
      if edge == stop
        path << edge
        shortest_path ||= path
        shortest_path = shortest_path.length <= path.length ? shortest_path : path
      else
        path += knight_moves(edge, stop)
      end
    end
    shortest_path
  end

  private

  def invalid?(place = @place)
    place.any? { |n| n < 0 || n > (size - 1)}
  end
end