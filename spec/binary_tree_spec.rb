require 'binary_tree'

RSpec.describe BinaryTree do

  #     3
  #    / \
  #   2   8
  #  / \   \
  # 9  10   4

  root_node = BinaryTree.create [3, 2, 9, nil, nil, 10, nil, nil, 8, nil, 4]
  # root node -> left child -> right child
  preorder_expected_output =   [3, 2, 9, 10, 8, 4]
  # left child -> root node -> right child
  inorder_expected_output =    [9, 2, 10, 3, 8, 4]
  # left child -> right child -> root node
  postorder_expected_output =  [9, 10, 2, 4, 8, 3]

  levelorder_expected_output = [3, 2, 8, 9, 10, 4]

  def check_output(method_name, root_node, expected_output)
    output_data = []
    BinaryTree.send(method_name, root_node) do |data|
      output_data.push data
    end
    expect(output_data).to eq expected_output
  end

  it 'rescursion preorder traversal' do
    check_output :recursion_preorder_traversal, root_node, preorder_expected_output
  end

  it 'rescursion inorder traversal' do
    check_output :recursion_inorder_traversal, root_node, inorder_expected_output
  end

  it 'rescursion postorder traversal' do
    check_output :recursion_postorder_traversal, root_node, postorder_expected_output
  end

  it 'recursion levelorder traversal' do
    check_output :recursion_levelorder_traversal, root_node, levelorder_expected_output
  end

  it 'stack preorder traversal' do
    check_output :stack_preorder_traversal, root_node, preorder_expected_output
  end

  it 'stack inorder traversal' do
    check_output :stack_inorder_traversal, root_node, inorder_expected_output
  end

  it 'stack postorder traversal' do
    check_output :stack_postorder_traversal, root_node, postorder_expected_output
  end

  it 'queue levelorder traversal' do
    check_output :queue_levelorder_traversal, root_node, levelorder_expected_output
  end

end