class BinaryHeap

  attr_accessor :data, :type

  def initialize(complete_binary_tree_arr = [], type: :min)
    @data = complete_binary_tree_arr.dup
    @type = type == :min ? :< : :>
    build
  end

  def push(num)
    @data << num
    up_adjust @data.size - 1
  end

  def shift
    shifted = @data.shift
    @data.unshift @data.pop
    down_adjust 0
    shifted
  end

  # O(logn)
  def up_adjust(child_index, limit = 0)
    value = @data[child_index]
    while child_index > limit
      parent_index = (child_index - 1) / 2
      break unless value.send(@type, @data[parent_index])
      @data[child_index] = @data[parent_index]
      child_index = parent_index
    end
    @data[child_index] = value
  end

  # O(logn)
  def down_adjust(parent_index, limit = @data.size)
    value = @data[parent_index]
    while (child_index = 2 * parent_index + 1) < limit
      if child_index + 1 < limit && @data[child_index + 1].send(@type, @data[child_index]) 
        child_index += 1
      end
      break unless value.send(@type == :< ? :> : :<, @data[child_index])
      @data[parent_index] = @data[child_index]
      parent_index = child_index
    end
    @data[parent_index] = value
  end

  private
  
    # O(n)
    def build
      index = (@data.size - 2) / 2
      while index >= 0
        down_adjust index
        index -= 1
      end
    end

end