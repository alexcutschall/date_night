class Node
  attr_reader   :score,
                :name
  attr_accessor :left,
                :right,
                :depth

  def initialize(score, name)
    @score = score
    @name = name
    @left = nil
    @right = nil
    @depth = nil
  end

  def move_left  
  end

  def move_right
  end
end
