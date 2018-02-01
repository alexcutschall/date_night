require 'pry'
require './lib/node.rb'
#make a list
#list has a root, this will be the @head attribute (This can either be created right off the back or not)
#change the head attribute to the root that everything will be based off of
#head. if head has already been created, evalutate based off the head
#move left and move right method
#When you start to see code repeating itself
#build this out for a couple levels and then use the node to delegate

class BinarySearchTree
  attr_reader :head

  def initialize
    @head = nil
    @depth = 0
  end

  def insert(score, name)
    if @head == nil
       @head = Node.new(score,name)
       @head.depth = 0
    else
       traverse(score,name)
     end
   end

  def traverse(score, name, current_node = @head)
    if current_node.score > score
       move_left(score, name)
    else
       move_right(score, name)
    end
  end

  def move_left(score, name, current_node = @head)
    if current_node.score > score && current_node.left == nil
      current_node.left = Node.new(score,name)
      current_node.left.depth += 1

    else
      current_node = current_node.left
      current_node.depth += 1
      move_left(score, name, current_node)
    end
  end

  def move_right(score, name, current_node = @head)
    if current_node.score < score && current_node.right == nil
      current_node.right = Node.new(score,name)
      current_node.right.depth += 1

    else
      current_node = current_node.right
      current_node.depth += 1
      move_right(score, name, current_node)
    end
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

  # def include?(number)
  #   if current_node.score == number
  #     return true
  #   else
  #     while current_node.score != number
  # end
# end
#use the traverse or another attribute that includes

   #
   # def depth?(depth_number)
   #   if depth_number = 61
   #     return 0
   #   else
   #     return 1
   #   end
   # end
end

#refactor depth to traverse through the tree
