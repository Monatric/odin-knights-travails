# Building a graph and its functionality
class Graph
  attr_accessor :list, :board

  def initialize
    @list = {}
    @board = Board.new
    build_graph
  end

  def build_graph
    i = 0
    x = 0
    board.structure.each do |row|
      y = 0
      row.each do |col|
        node = Node.new
        node.name = "V#{i}"
        node.data = board.structure[x][y]
        add_node(node)
        puts "#{x} #{y}"
        y += 1
        i += 1
      end
      x += 1
    end
  end

  def add_node(node_to_add)
    list[node_to_add] = Set.new if list[node_to_add].nil?
    list
  end
end
