class Array

  # time:
  #   average: O(nlogn)
  #   badest: O(n²)
  # space: O(logn)
  # stable: false

  def recursion_quick_sort!(*args, order: :asc, with: :unilateral)
    start_index = args[0] || 0
    end_index = args[1] || size - 1
    sort_method_name = "#{with.to_s}_partition_quick_sort!".to_sym
    return self unless start_index < end_index
    pivot_index = send(sort_method_name, order, start_index, end_index)
    recursion_quick_sort!(start_index, pivot_index - 1, order: order, with: with)
    recursion_quick_sort!(pivot_index + 1, end_index, order: order, with: with)
    self
  end

  def stack_quick_sort!(order: :asc, with: :unilateral)
    sort_method_name = "#{with.to_s}_partition_quick_sort!".to_sym
    return self unless size > 1
    stack = [{start_index: 0, end_index: size - 1}]
    while !stack.empty?
      sort_range = stack.pop
      pivot_index = send(sort_method_name, order, sort_range[:start_index], sort_range[:end_index])
      start_index, end_index = sort_range[:start_index], pivot_index - 1
      stack << {start_index: start_index, end_index: end_index} if start_index < end_index
      start_index, end_index = pivot_index + 1, sort_range[:end_index]
      stack << {start_index: start_index, end_index: end_index} if start_index < end_index
    end
    self    
  end

  private

    def bilateral_partition_quick_sort!(type, start_index, end_index)
      pivot_index, pivot = start_index, unshift_pivot!(start_index, end_index)
      while start_index != end_index
        end_index -= 1 while start_index != end_index && self[end_index].send(type == :asc ? :> : :<, pivot)
        start_index += 1 while start_index != end_index && self[start_index].send(type == :asc ? :<= : :>=, pivot)
        self[start_index], self[end_index] = self[end_index], self[start_index] if start_index != end_index
      end
      self[start_index], self[pivot_index] = self[pivot_index], self[start_index]
      pivot_index = start_index
    end

    def unilateral_partition_quick_sort!(type, start_index, end_index)
      mark_index, pivot_index, pivot = start_index, start_index, unshift_pivot!(start_index, end_index)
      while start_index != end_index
        start_index += 1
        if self[start_index].send(type == :asc ? :< : :>, pivot)
          mark_index += 1
          self[start_index], self[mark_index] = self[mark_index], self[start_index]
        end
      end
      self[mark_index], self[pivot_index] = self[pivot_index], self[mark_index]
      pivot_index = mark_index
    end

    def unshift_pivot!(start_index, end_index)
      # pivot_index = rand(start_index..end_index)
      # self[start_index], self[pivot_index] = self[pivot_index], self[start_index]
      middle_index = start_index + (end_index - start_index) / 2
      # 1) and 2) makes sure the largest number is in the right
      # 1)
      if self[middle_index] > self[end_index]
        self[middle_index], self[end_index] = self[end_index], self[middle_index]
      end
      # 2)
      if self[start_index] > self[end_index]
        self[start_index], self[end_index] = self[end_index], self[start_index]
      end
      # 3) makes sure the least number is in the middle and the medium number is in the left
      if self[middle_index] > self[start_index]
        self[start_index], self[middle_index] = self[middle_index], self[start_index]
      end 
      self[start_index]
    end

end