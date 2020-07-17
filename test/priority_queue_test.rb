require 'minitest/autorun'
require 'priority_queue'

class PriorityQueueTest < Minitest::Test

  def setup
    @enqueue_nums = [1, 3, 5, 9, 0, 2, 4, 10]
    @min_queue_dequeue_expected_output = @enqueue_nums.sort
    @max_queue_dequeue_expected_output = @enqueue_nums.sort {|a, b| b <=> a}

    @min_queue = PriorityQueue.new []
    @max_queue = PriorityQueue.new [], type: :max

    @enqueue_nums.each do |num|
      @min_queue.enqueue num
      @max_queue.enqueue num
    end
  end

  # test_min_queue_dequeue, test_max_queue_dequeue
  %w(min max).each do |type|
    define_method "test_#{type}_queue_dequeue" do
      dequeue_output = []
      @enqueue_nums.each do |num|
        dequeue_output << instance_variable_get("@#{type}_queue").dequeue
      end
      assert_equal dequeue_output, instance_variable_get("@#{type}_queue_dequeue_expected_output")
    end
  end

end

