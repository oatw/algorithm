require 'binary_heap'

class PriorityQueue < BinaryHeap
  alias_method :enqueue, :push
  alias_method :dequeue, :shift
end