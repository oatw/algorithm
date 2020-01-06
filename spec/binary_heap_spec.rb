require 'binary_heap'

RSpec.describe BinaryHeap do

  #           7
  #       /      \
  #      1        3
  #    /  \     /  \
  #   10   5   2    8
  #  /  \
  # 9    6
  complete_binary_tree =             [7, 1, 3, 10, 5, 2, 8, 9, 6]

  #             1
  #         /      \
  #        5        2
  #      /  \     /  \
  #     6    7   3    8
  #   /  \
  #  9   10
  min_heap_expected_output =         [1, 5, 2, 6, 7, 3, 8, 9, 10]
  min_heap_push_num =                4
  min_heap_pushed_expected_output =  [1, 4, 2, 6, 5, 3, 8, 9, 10, 7]
  min_heap_shifted_expected_output = [2, 4, 3, 6, 5, 7, 8, 9, 10]

  #            10
  #         /      \
  #        9        8
  #      /  \     /  \
  #     7    5   2    3
  #   /  \
  #  1    6
  max_heap_expected_output =         [10, 9, 8, 7, 5, 2, 3, 1, 6]
  max_heap_push_num =                10
  max_heap_pushed_expected_output =  [10, 10, 8, 7, 9, 2, 3, 1, 6, 5]
  max_heap_shifted_expected_output = [10, 9, 8, 7, 5, 2, 3, 1, 6]

  min_heap = BinaryHeap.new complete_binary_tree
  max_heap = BinaryHeap.new complete_binary_tree, type: :max


  it 'build min heap' do
    expect(min_heap.data).to eq min_heap_expected_output
  end

  it 'min heap push' do
    min_heap.push min_heap_push_num
    expect(min_heap.data).to eq min_heap_pushed_expected_output
  end

  it 'min heap shift' do
    min_heap.shift
    expect(min_heap.data).to eq min_heap_shifted_expected_output
  end

  it 'build max heap' do
    expect(max_heap.data).to eq max_heap_expected_output
  end

  it 'max heap push' do
    max_heap.push max_heap_push_num
    expect(max_heap.data).to eq max_heap_pushed_expected_output
  end

  it 'max heap shift' do
    max_heap.shift
    expect(max_heap.data).to eq max_heap_shifted_expected_output
  end

end