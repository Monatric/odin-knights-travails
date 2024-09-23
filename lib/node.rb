# Node
class Node
  attr_accessor :name, :data, :prev

  def initialize(name, data)
    @name = name
    @data = data
    @prev = nil
  end
end
