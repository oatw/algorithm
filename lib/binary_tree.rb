class BinaryTree

  class TreeNode
    attr_accessor :data, :left_child, :right_child
    def initialize(data)
      @data = data
    end
  end

  class << self

    def create(tree_array = [])
      return nil if tree_array.empty?
      data = tree_array.shift
      return nil unless data
      node = TreeNode.new data
      node.left_child = create tree_array 
      node.right_child = create tree_array
      node
    end

    def recursion_preorder_traversal(node, &block)
      return unless node && block_given?
      yield node.data
      recursion_preorder_traversal node.left_child, &block
      recursion_preorder_traversal node.right_child, &block
    end

    def recursion_inorder_traversal(node, &block)
      return unless node && block_given?
      recursion_inorder_traversal node.left_child, &block
      yield node.data
      recursion_inorder_traversal node.right_child, &block
    end

    def recursion_postorder_traversal(node, &block)
      return unless node && block_given?
      recursion_postorder_traversal node.left_child, &block
      recursion_postorder_traversal node.right_child, &block
      yield node.data
    end

    def recursion_levelorder_traversal(node, **_options, &block)
      return unless node && block_given?
      left_child = node.left_child
      right_child = node.right_child
      yield node.data unless _options[:skip_parent]
      yield left_child.data if left_child
      yield right_child.data if right_child
      recursion_levelorder_traversal left_child, {skip_parent: true}, &block
      recursion_levelorder_traversal right_child, {skip_parent: true}, &block
    end

    def stack_preorder_traversal(node, &block)
      return unless block_given?
      stack = []
      while node || !stack.empty?
        while node
          yield node.data
          stack << node
          node = node.left_child
        end
        node = stack.pop.right_child unless stack.empty?
      end
    end

    def stack_inorder_traversal(node, &block)
      return unless block_given?
      stack = []
      while node || !stack.empty?
        while node
          stack << node
          node = node.left_child
        end
        unless stack.empty?
          node = stack.pop
          yield node.data
          node = node.right_child
        end
      end
    end

    def stack_postorder_traversal(node, &block)
      return unless block_given?
      stack = []
      visited = nil
      while node || !stack.empty?
        while node
          stack << node
          node = node.left_child
        end
        unless stack.empty?
          node = stack.last.right_child
          next if node && node != visited
          node = nil
          visited = stack.pop
          yield visited.data 
        end
      end
    end

    def queue_levelorder_traversal(node, &block)
      return unless block_given?
      queue = []
      left_child = nil
      right_child = nil
      while node
        yield node.data
        queue << left_child if left_child = node.left_child
        queue << right_child if right_child = node.right_child
        node = queue.shift
      end
    end

  end

end