require 'minitest/autorun'
require 'bubble_sort'

class BubbleSortTest < Minitest::Test

  def setup
    @input_array = [1, 10, 3, 2, 4, 5, 9, 5, 8, 4, 7, 6, 0]
    @asc_bubble_sort_expected_output = @input_array.sort
    @desc_bubble_sort_expected_output = @input_array.sort {|a, b| b <=> a}
  end

  def test_asc_bubble_sort
    assert_equal @input_array.bubble_sort!(:asc), @asc_bubble_sort_expected_output
  end

  def test_desc_bubble_sort
    assert_equal @input_array.bubble_sort!(:desc), @desc_bubble_sort_expected_output
  end

end
