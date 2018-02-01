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


    assert_instance_of Node, tree.head
    assert_equal 61, tree.head.score
    assert_equal "Bill & Ted's Excellent Adventure", tree.head.name
  end

  def test_binary_tree_can_track_depth
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado")
    tree.insert(10, "Superman v Batman")
    tree.insert(98, "Clockwork Orange")
    binding.pry

    assert_equal 0, tree.head.depth
    assert_equal 1, tree.head.left.depth
    assert_equal 1, tree.head.right.depth
  end

  def test_binary_search_tree_can_move_to_the_left
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")

    assert_equal (61), tree.head.score
    assert_equal (16), tree.head.left.score
  end

  def test_binary_search_tree_can_move_to_the_right
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(92, "Sharknado 3")
    # tree.insert(16, "Johnny English")
    # tree.insert(98, "Clockwork Orange")
    # tree.insert(10, "Superman v Batman")
    # tree.insert(1, "Percy Jackson")

    assert_equal (61), tree.head.score
    assert_equal (92), tree.head.right.score
  end

  def test_can_find_a_min
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(10, "Batman v Superman")
    tree.insert(80, "Grand Budapest Hotel")
    tree.insert(1, "Rubber")

    assert_equal (1), tree.min
  end

  def test_can_find_max
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(10, "Batman v Superman")
    tree.insert(80, "Grand Budapest Hotel")
    tree.insert(5, "Rubber")
    tree.insert(99, "Dr. Strangelove")

    assert_equal (99), tree.max
  end



  # def test_binary_search_tree_has_an_include_function
  #   tree = BinarySearchTree.new
  #   tree.insert(61, "Bill & Ted's Excellent Adventure")
  #
  #   assert tree.include?(61)
  # end
  #
  #
  #
  # def test_binary_tree_has_depth
  #   tree = BinarySearchTree.new
  #   tree.insert(61, "Bill & Ted's Excellent Adventure")
  #   tree.insert(16, "Johnny English")
  #   tree.insert(92, "Sharknado 3")
  #   tree.insert(10, "")
  #
  #   assert_equal 0, tree.head.depth
  #   assert_equal 1, tree.head.left.depth
  #   assert_equal 1, tree.head.right.depth

end
