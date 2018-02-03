require './lib/node.rb'
class BinarySearchTree
  attr_reader :head

  def initialize
    @head = nil
  end

  def insert(score, name)
    @depth = 0
    if @head.nil?
       @head = Node.new(score,name)
       @depth
    else
       traverse(score, name, @head)
     end
   end

  def traverse(score, name, current_node)
    if current_node.score > score
       move_left(score, name, current_node)
    elsif current_node.score < score
       move_right(score, name, current_node)
    end
  end

  def move_left(score, name, current_node)
    if current_node.left.nil?
       current_node.left = Node.new(score,name)
       return @depth += 1
    else
      node_travel_direction(score,name, current_node)
    end
  end

  def move_right(score, name, current_node)
    if current_node.right.nil?
      current_node.right = Node.new(score,name)
      return @depth += 1
    else
      node_travel_direction(score, name, current_node)
    end
  end

  def node_travel_direction(score, name, current_node)
    @depth += 1
      if score < current_node.score
        current_node = current_node.left
      else
        current_node = current_node.right
    end
       traverse(score, name, current_node)
  end

  def min
    if @head.left == nil
       return @head.score
    else
      current_node = @head
      while current_node.left != nil
        current_node = current_node.left
    end
    return current_node.score
  end
end

  def max
    if @head.right == nil
      return @head.score
    else
      current_node = @head
      while current_node.right != nil
        current_node = current_node.right
      end
      return current_node.score
    end
  end

  def include?(number, current_node = @head)
    if current_node.nil?
      false
    elsif current_node.score == number
      true
    else
      include_traverse(number, current_node)
  end
end

  def include_traverse(number, current_node)
    if number > current_node.score
      include?(number, current_node.right)
    else number < current_node.score
      include?(number, current_node.left)
    end
  end

  def depth_of(number, current_node = @head, depth = 0)
    if current_node.nil?
      nil
    elsif current_node.score == number
      depth
    else
      depth_of_traverse(number,current_node, depth)
    end
  end

  def depth_of_traverse(number, current_node, depth)
    if current_node.score > number
       depth += 1
       depth_of(number, current_node.left, depth)
    else current_node.score < number
       depth += 1
       depth_of(number, current_node.right, depth)
     end
  end

  def load(file_name)
    insertions = 0
    file = File.read(file_name)
    splitted_file = file.split(", ")
    insert(splitted_file[0].to_i, splitted_file[1])
    insertions += 1
  end

  def height(head = @head)
    return-1 if head.nil?
    left_head_height = height(head.left)
    right_head_height = height(head.right)

    if left_head_height > right_head_height
      left_head_height + 1
    else
      right_head_height + 1
    end
  end

def sort(current_node = @head, sorted = [])
  return sorted if current_node.nil?

  sort(current_node.left, sorted)
  sorted << {current_node.name => current_node.score}

  sort(current_node.right, sorted)
  sorted << {current_node.name => current_node.score}

  sorted
end


def leaves(current_node = @head)
leaves_count = 0
  if current_node.nil?
     leaves_count = 0

  elsif current_node.left.nil? && current_node.right.nil?
    leaves_count += 1

  else
    leaves(current_node.left) + leaves(current_node.right)
  end
 end
end
