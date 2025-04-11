# frozen_string_literal: true

require './lib/vertex'

def knight_moves(start, stop)

  paths_q = [[start]]
  until paths_q.empty? 
    curr = paths_q.shift
    edges = find_edges(curr[-1])
    edges.each do |edge|
      if edge == stop
        return curr << edge
      elsif curr.include?(edge)
        next
      else
        new_path = curr.clone << edge
        paths_q << new_path
      end
    end
  end
end

def find_edges(place)
  moves = [[-1, -2], [-2, -1], [1, -2], [-2, 1], [-1, 2], [2, -1], [1, 2], [2, 1]]
  edges = []
  moves.each do |move|
    edge = [place[0] + move[0], place[1] + move[1]]
    next if invalid?(edge)
    edges << edge
  end
  edges
end

def invalid?(place)
  # TO DO: TAKE OUT THIS VARIABLE TRANSFER IT T0 VERTEX OBJECT
  size = 8
  place.any? { |n| n < 0 || n > (size - 1)}
end



