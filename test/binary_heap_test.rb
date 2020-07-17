require 'minitest/autorun'
require 'binary_heap'

class BinaryHeapTest < Minitest::Test

  def setup
    #           7
    #       /      \
    #      1        3
    #    /  \     /  \
    #   10   5   2    8
    #  /  \
    # 9    6
    @complete_binary_tree =             [7, 1, 3, 10, 5, 2, 8, 9, 6]

    #             1
    #         /      \
    #        5        2
    #      /  \     /  \
    #     6    7   3    8
    #   /  \
    #  9   10
    @min_heap_expected_output =         [1, 5, 2, 6, 7, 3, 8, 9, 10]
    @min_heap_push_num =                4
    @min_heap_pushed_expected_output =  [1, 4, 2, 6, 5, 3, 8, 9, 10, 7]
    @min_heap_shifted_expected_output = [2, 4, 3, 6, 5, 7, 8, 9, 10]

    #            10
    #         /      \
    #        9        8
    #      /  \     /  \
    #     7    5   2    3
    #   /  \
    #  1    6
    @max_heap_expected_output =         [10, 9, 8, 7, 5, 2, 3, 1, 6]
    @max_heap_push_num =                10
    @max_heap_pushed_expected_output =  [10, 10, 8, 7, 9, 2, 3, 1, 6, 5]
    @max_heap_shifted_expected_output = [10, 9, 8, 7, 5, 2, 3, 1, 6]
  end

  def min_heap
    BinaryHeap.new @complete_binary_tree
  end

  def max_heap
    BinaryHeap.new @complete_binary_tree, type: :max
  end

  %w(min max).each do |type|
    # pushed_min_heap, pushed_max_heap
    define_method "pushed_#{type}_heap" do
      heap = send("#{type}_heap")
      heap.push instance_variable_get("@#{type}_heap_push_num")
      heap
    end

    # shifted_min_heap, shifted_max_heap
    define_method "shifted_#{type}_heap" do
      heap = send("pushed_#{type}_heap")
      heap.shift
      heap
    end

    # test_build_min_heap, test_build_max_heap
    define_method "test_build_#{type}_heap" do
      assert_equal send("#{type}_heap").data, instance_variable_get("@#{type}_heap_expected_output")
    end

    # test_min_heap_push, test_min_heap_shift, test_max_heap_push, test_max_heap_shift
    %w(push shift).each do |action|
      define_method "test_#{type}_heap_#{action}" do
        assert_equal send("#{action}ed_#{type}_heap").data, instance_variable_get("@#{type}_heap_#{action}ed_expected_output")
      end
    end
  end

end
