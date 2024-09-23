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
        node = Node.new("V#{i}", board.structure[x][y])
        add_node(node)
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

  def add_connection(origin, destination)
    add_node(origin)
    add_node(destination)

    list[origin] << destination
    list
  end

  def find_node_by_data(data)
    list.keys.find { |node| node.data == data }
  end

  def find_node_by_name(name)
    list.keys.find { |node| node.name == name }
  end

  def print_graph_data
    puts "{"
    list.each do |key, val|
      puts "#{key.data} => #{val}"
    end
    puts "}"
  end
end
