require 'binary_heap'

class BinaryHeap

  class << self
    
    # time: O(nlogn)
    # space: O(1)
    # stable: false
    def sort(arr = [], order: :asc)
      return arr if arr.empty?
      binary_heap = BinaryHeap.new(arr, type: order == :asc ? :max : :min)
      append_index = binary_heap.data.size - 1
      while append_index > 0
        binary_heap.data[0], binary_heap.data[append_index] = binary_heap.data[append_index], binary_heap.data[0]
        binary_heap.down_adjust(0, append_index)
        append_index -= 1
      end
      binary_heap.data
    end

  end

end