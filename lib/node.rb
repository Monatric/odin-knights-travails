# Node
class Node
  attr_accessor :name, :data, :next

  def initialize(name, data)
    @name = name
    @data = data
    @next = nil
  end
end
