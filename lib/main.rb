require_relative "board"
require_relative "graph"
require_relative "node"
require "set"

graph = Graph.new
graph.knight_moves([3, 3], [4, 3])
# graph.knight_moves([0, 0], [7, 7])
# graph.knight_moves([3,3], [0, 0])
