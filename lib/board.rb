# 2D Board
class Board
  attr_accessor :structure

  def initialize
    @structure = Array.new(8) do |row|
      Array.new(8) do |col|
        "[#{row}][#{col}]"
      end
    end
  end
end
