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
    @current_node = nil
  end

  def insert(score,name)
    new_node = Node.new(score,name)
    if @head == nil
       @head = new_node

    elsif @head != nil
        if @head.score > new_node.score && @head.left == nil
          head.left = new_node

        elsif @head.score < new_node.score && @head.right == nil
          head.right = new_node

        elsif @head.score > new_node.score && @head.left != nil
          @current_node = head.left
          insert(@current_node.score, @current_node.name)

        else  @head.score < new_node.score && @head.right != nil
          @current_node = head.right
          insert(current_node.score, current_node.name)
        end
      end
  end


   # def include?(number)
   #   if @head.score == number
   #     true
   #   elsif @head.left.score == number
   #     true
   #   elsif @head.right.score == number
   #     true
   #   else
   #     false
   #   end
   # end
   #
   # def depth?(depth_number)
   #   if depth_number = 61
   #     return 0
   #   else
   #     return 1
   #   end
   # end

end

#I need to add action to the nodes to make THEM do the decisions
  #the node knows whether the left and right are nil
  #functions move left and move right depending whether
  #or not they're nil
#refactor include to go traverse the tree
#refactor depth to traverse through the tree
