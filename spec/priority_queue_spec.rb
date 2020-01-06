require 'priority_queue'

RSpec.describe PriorityQueue do

  enqueue_nums = [1, 3, 5, 9, 0, 2, 4, 10]
  min_queue_dequeue_expected_output = enqueue_nums.sort
  max_queue_dequeue_expected_output = enqueue_nums.sort {|a, b| b <=> a}

  min_queue = PriorityQueue.new []
  max_queue = PriorityQueue.new [], type: :max

  enqueue_nums.each do |num|
    min_queue.enqueue num
    max_queue.enqueue num
  end

  it 'min queue dequeue' do
    min_queue_dequeue_output = []
    enqueue_nums.each do |num|
      min_queue_dequeue_output << min_queue.dequeue 
    end
    expect(min_queue_dequeue_output).to eq min_queue_dequeue_expected_output
  end

  it 'max queue dequeue' do
    max_queue_dequeue_output = []
    enqueue_nums.each do |num|
      max_queue_dequeue_output << max_queue.dequeue 
    end
    expect(max_queue_dequeue_output).to eq max_queue_dequeue_expected_output
  end

end