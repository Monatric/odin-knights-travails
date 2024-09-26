# Node
class Node
  attr_accessor :data, :prev

  def initialize(data)
    @data = data
    @prev = nil
  end
end
