require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/node.rb'

class NodeTest < Minitest::Test


  def test_node_exists
    node = Node.new(61, "Bill & Ted's Excellent Adventure")
    assert_instance_of Node, node
  end

  def test_node_has_a_score
    node = Node.new(61, "Bill & Ted's Excellent Adventure")
    assert_equal 61, node.score
  end

  def test_has_a_name
    node = Node.new(61, "Bill & Ted's Excellent Adventure")
    assert_equal "Bill & Ted's Excellent Adventure", node.name
  end

  def test_binary_evaluates_left_is_nil
    node = Node.new(61, "Bill & Ted's Excellent Adventure")

    assert_nil node.move_left
  end

  def test_binary_evaluates_right_is_nil
    node = Node.new(61, "Bill & Ted's Excellent Adventure")

    assert_nil node.move_right
  end


end
