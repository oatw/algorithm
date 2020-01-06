class Array

  # time: O(n²) 
  # space: O(1)
  # stable: true
  def bubble_sort!(order = :asc)
    return self if empty?
    sort_times_limit = sort_border_index = size - 1
    last_exchange_index = sort_times = 0
    while sort_times < sort_times_limit
      is_sorted = true
      sort_index = 0
      while sort_index < sort_border_index  
        if self[sort_index].send(order == :asc ? :> : :<, self[sort_index + 1])
          self[sort_index], self[sort_index + 1] = self[sort_index + 1], self[sort_index]
          is_sorted = false
          last_exchange_index = sort_index
        end
        sort_index += 1
      end
      break if is_sorted
      sort_border_index = last_exchange_index
      sort_times += 1
    end
    self
  end

end