require 'minitest/autorun'
require 'binary_tree'

class BinaryTreeTest < Minitest::Test

  def setup
    #     3
    #    / \
    #   2   8
    #  / \   \
    # 9  10   4

    @root_node = BinaryTree.create [3, 2, 9, nil, nil, 10, nil, nil, 8, nil, 4]
    # root node -> left child -> right child
    @preorder_expected_output =   [3, 2, 9, 10, 8, 4]
    # left child -> root node -> right child
    @inorder_expected_output =    [9, 2, 10, 3, 8, 4]
    # left child -> right child -> root node
    @postorder_expected_output =  [9, 10, 2, 4, 8, 3]

    @levelorder_expected_output = [3, 2, 8, 9, 10, 4]
  end

  def check_output(method_name, expected_output)
    output_data = []
    BinaryTree.send(method_name, @root_node) do |data|
      output_data.push data
    end
    assert_equal output_data, expected_output
  end

  # test_recursion_preorder_traversal, test_recursion_inorder_traversal,
  # test_recursion_postorder_traversal, test_stack_preorder_traversal,
  # test_stack_inorder_traversal, test_stack_postorder_traversal
  %w(recursion stack).each do |type|
    %w(preorder inorder postorder).each do |order|
      define_method "test_#{type}_#{order}_traversal" do
        check_output "#{type}_#{order}_traversal", instance_variable_get("@#{order}_expected_output")
      end
    end
  end

  # test_recursion_levelorder_traversal, test_queue_levelorder_traversal
  %w(recursion queue).each do |type|
    define_method "test_#{type}_levelorder_traversal" do
      check_output "#{type}_levelorder_traversal", @levelorder_expected_output
    end
  end

end

