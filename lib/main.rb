require_relative "board"
require_relative "graph"
require_relative "node"
require "set"

graph = Graph.new
# graph.add_node("test")
# puts graph.list["[0][0]"]
# list = graph.list
# v0 = graph.find_node_by_name("V0")
# v1 = graph.find_node_by_data([0, 1])
# p  v1
# graph.add_connection(v0, v1)
# graph.add_connection("V0", "V3")

# puts graph.list[v0]
graph.knight_moves([0, 0], [1, 2])
# graph.print_graph_data
