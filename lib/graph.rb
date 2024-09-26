# Building a graph and its functionality
class Graph
  KNIGHT_OPTIONS = [
    [2, 1],
    [2, -1],
    [1, 2],
    [1, -2],
    [-2, 1],
    [-2, -1],
    [-1, 2],
    [-1, -2]
  ].freeze

  attr_accessor :list, :board

  def initialize
    @list = {}
    @board = Board.new
    build_graph
  end

  def build_graph
    x = 0
    board.structure.each do |row|
      y = 0
      row.each do
        add_node(Node.new([x, y]))
        y += 1
      end
      x += 1
    end
  end

  def add_node(node_to_add)
    list[node_to_add] = Set.new if list[node_to_add].nil?
    list
  end

  def add_connection(origin, destination)
    list[origin] << destination
    list
  end

  def find_node_by_data(data)
    list.keys.find { |node| node.data == data }
  end

  def find_node_by_name(name)
    list.keys.find { |node| node.name == name }
  end

  def knight_moves(origin, destination)
    origin = find_node_by_data(origin)
    queue = []
    queue.push(origin)
    visited_nodes = Set.new << origin
    until queue[0] == find_node_by_data(destination)
      front_node = queue.shift
      front_data = front_node.data
      insert_knight_moves(front_node, front_data, visited_nodes, queue)
    end
    print_path(find_node_in_sets(find_node_by_data(destination)))
  end

  def insert_knight_moves(front_node, front_data, visited_nodes, queue)
    KNIGHT_OPTIONS.each do |move|
      next_coord = [front_data[0] + move[0], front_data[1] + move[1]]
      next if exceeds_board?(next_coord) || visited_nodes.include?(find_node_by_data(next_coord))

      visited_nodes.add(find_node_by_data(next_coord))
      find_node_by_data(next_coord).prev = front_node
      queue.push(find_node_by_data(next_coord))
      add_connection(front_node, find_node_by_data(next_coord))
    end
  end

  def find_node_in_sets(node)
    list.each_value do |set|
      return node if set.include?(node)
    end
    nil
  end

  def print_path(destination)
    p destination.data
    return destination.data if destination.prev.nil?

    print_path(destination.prev)
  end

  def exceeds_board?(move)
    return true if move[0].negative? || move[0] > 7 || move[1].negative? || move[1] > 7

    false
  end
end
