require 'minitest/autorun'
require 'binary_heap_sort'

class BinaryHeapSortTest < Minitest::Test

  def setup
    #           7
    #       /      \
    #      1        3
    #    /  \     /  \
    #   10   5   2    8
    #  /  \
    # 9    6
    @input_array = [7, 1, 3, 10, 5, 2, 8, 9, 6]

    #            10                           1
    #         /      \                    /      \
    #        9        8                  2        3
    #      /  \     /  \      ->       /  \     /  \
    #     7    5   2    3             5    6   7    8
    #   /  \                        /  \
    #  1    6                      9   10
    @asc_sort_expected_output = @input_array.sort

    #             1                            10
    #         /      \                      /      \
    #        5        2                    9        8
    #      /  \     /  \      ->         /  \     /  \
    #     6    7   3    8               7    6   5    3
    #   /  \                          /  \
    #  9   10                        2    1
    @desc_sort_expected_output = @input_array.sort {|a, b| b <=> a}
  end

  def test_sort_asc
    assert_equal BinaryHeap.sort(@input_array), @asc_sort_expected_output
  end

  def test_sort_desc
    assert_equal BinaryHeap.sort(@input_array, order: :desc), @desc_sort_expected_output
  end

end
