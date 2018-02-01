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

    assert_equal 0, tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 1, tree.insert(16, "Johnny English")
    assert_equal 1, tree.insert(92, "Sharknado")
    assert_equal 2, tree.insert(98, "Clockwork Orange")
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



  def test_binary_search_tree_has_an_include_function
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(10, "Batman v Superman")
    tree.insert(80, "Grand Budapest Hotel")
    tree.insert(5, "Rubber")
    tree.insert(99, "Dr. Strangelove")

    assert tree.include?(61)
    assert tree.include?(16)
    assert tree.include?(10)
    assert tree.include?(80)
    assert tree.include?(5)
    assert tree.include?(99)
  end

  def test_binary_tree_has_a_depth_of_function
    tree = BinarySearchTree.new
    tree.insert(92, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(98, "Clockwork Orange")
    tree.insert(10, "Batman v Superman")
    tree.insert(5, "Rubber")

    assert_equal 0, tree.depth_of(92)
    assert_equal 1, tree.depth_of(16)
    assert_equal 1, tree.depth_of(98)
    assert_equal 2, tree.depth_of(10)
    assert_equal 3, tree.depth_of(5)
  end

  def test_binary_search_can_input_a_file
    tree = BinarySearchTree.new

    assert 99, tree.load('movies.txt')
  end

  def test_binary_has_height_function
    tree = BinarySearchTree.new
    tree.insert(92, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(98, "Clockwork Orange")
    tree.insert(10, "Batman v Superman")
    tree.insert(5, "Rubber")

    assert_equal 3, tree.height
  end

  def test_binary_has_a_leaves_function
    tree = BinarySearchTree.new
    tree.insert(92, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(98, "Clockwork Orange")

    assert_equal (2), tree.leaves
  end

  # def test_binary_tree_has_a_health_function
  #   tree.insert(98, "Animals United")
  #   tree.insert(58, "Armageddon")
  #   tree.insert(36, "Bill & Ted's Bogus Journey")
  #   tree.insert(93, "Bill & Ted's Excellent Adventure")
  #   tree.insert(86, "Charlie's Angels")
  #   tree.insert(38, "Charlie's Country")
  #   tree.insert(69, "Collateral Damage")
  #
  #   assert_equal [[98,7,100]], tree.health(0)
  #   assert_equal [[56,8,85]], tree.health(1)
  #   asser_equal [[36,2,28], [93,3,42]]
  #
  # end

end
