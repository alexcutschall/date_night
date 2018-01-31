require 'minitest/autorun'
require 'minitest/pride'
require './lib/binary_search_tree.rb'
require './lib/node.rb'
require 'pry'

class BinarySearchTreeTest < Minitest::Test
  def test_binary_search_tree_exists
    tree = BinarySearchTree.new

    assert_equal BinarySearchTree, tree.class
  end

  def test_binary_search_tree_has_a_head
    tree = BinarySearchTree.new

    assert_nil tree.head
  end

  def test_binary_search_tree_has_an_insert_function_for_head
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    binding.pry
    tree.insert(98, "Clockwork Orange")
    # binding.pry



    #assertion as to what the return value is 0
    assert_instance_of Node, tree.head
    assert_equal 61, tree.head.score
    assert_equal "Bill & Ted's Excellent Adventure", tree.head.name
  end

  def test_binary_search_tree_can_move_to_the_left
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")

    assert_equal (61), tree.head.score
    #trees left score is 16
    assert_equal (16), tree.head.left.score
  end

  def test_binary_search_tree_can_move_to_the_right
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(92, "Sharknado 3")

    assert_equal (61), tree.head.score
    assert_equal (92), tree.head.right.score
  end

  # def test_binary_search_tree_had_an_include_function
  #   tree = BinarySearchTree.new
  #   tree.insert(61, "Bill & Ted's Excellent Adventure")
  #   tree.insert(16, "Johnny English")
  #   tree.insert(92, "Sharknado 3")
  #
  #   assert tree.include?(92)
  #   refute tree.include?(10)
  # end
  #
  # def test_binary_tree_has_depth
  #   tree = BinarySearchTree.new
  #   tree.insert(61, "Bill & Ted's Excellent Adventure")
  #   tree.insert(16, "Johnny English")
  #   tree.insert(92, "Sharknado 3")
  #
  #   assert_equal 0, tree.head.depth
  #   assert_equal 1, tree.head.left.depth
  #   assert_equal 1, tree.head.right.depth
  # end

  # def test_tree_can_keep_adding
  #   tree = BinarySearchTree.new
  #   tree.insert(61, "Bill & Ted's Excellent Adventure")
  #   tree.insert(16, "Johnny English")
  #   tree.insert(92, "Sharknado 3")
  #   tree.insert(34, "Hannibal Buress: Comedy Camisado")
  #   tree.insert(63, "Meet My Valentine")
  #   tree.insert(22, "Experimenter")
  #   tree.insert(84, "French Dirty")
  #
  #
  # end
end
