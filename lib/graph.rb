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
  ]

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
        node = Node.new("V#{i}", [x, y])
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
    # add_node(origin)
    # add_node(destination)

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

  def knight_moves(origin, destination)
    origin = find_node_by_data(origin)
    queue = []
    queue.push(origin)
    until queue[0] == find_node_by_data(destination)
      front_node = queue.shift
      front_data = front_node.data
      p queue
      next_move = KNIGHT_OPTIONS.each do |move|
        next_x = (front_data[0] + move[0])
        next_y = (front_data[1] + move[1])
        next_coord = [next_x, next_y]
        unless exceeds_board?(next_coord)
          queue.push(find_node_by_data(next_coord))
          add_connection(front_node, find_node_by_data(next_coord))
        end
      end
    end
  end
  # stopped from here. Next task is give it more tests if it will work and try to print the path

  def exceeds_board?(move)
    return true if move[0].negative? || move[0] > 7 || move[1].negative? || move[1] > 7

    false
  end
end
