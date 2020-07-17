require 'minitest/autorun'
require 'quick_sort'

class QuickSortTest < Minitest::Test

  def setup
    @input_array = [1, 3, 2, 9, 8, 1, 0, 10, 6, 7, 5, 4]
    @asc_expected_output = @input_array.sort
    @desc_expected_output = @input_array.sort {|a, b| b <=> a}
  end

  # test_recursion_unilateral_quick_sort_asc, test_recursion_unilateral_quick_sort_desc,
  # test_recursion_bilateral_quick_sort_asc, test_recursion_bilateral_quick_sort_desc,
  # test_stack_unilateral_quick_sort_asc, test_stack_unilateral_quick_sort_desc,
  # test_stack_bilateral_quick_sort_asc, test_stack_bilateral_quick_sort_desc
  %w(recursion stack).each do |type|
    %w(unilateral bilateral).each do |with|
      %w(asc desc).each do |order|
        define_method "test_#{type}_#{with}_quick_sort_#{order}" do
          sorted = @input_array.dup.send("#{type}_quick_sort!", with: with.to_sym, order: order.to_sym)
          assert_equal sorted, instance_variable_get("@#{order}_expected_output")
        end
      end
    end
  end

end
