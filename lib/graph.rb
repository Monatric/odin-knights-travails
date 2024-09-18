# Building a graph and its functionality
class Graph
  attr_accessor :graph

  def initialize
    @graph = {}
  end

  def add_node(node_to_add)
    graph[node_to_add] = Set.new if graph[node_to_add].nil?
    graph
  end
end
