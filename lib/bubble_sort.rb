class Array

  # T(n) = O(n²)
  # S(n) = O(1)
  # stable: true
  def bubble_sort!(order = :asc)
    return self if empty?
    max_sort_times = sort_border = size - 1
    max_sort_times.times.each do
      is_sorted = true
      (0...sort_border).each do |i|
        if self[i].send(order === :asc ? :> : :<, self[i + 1])
          self[i], self[i + 1] = self[i + 1], self[i]
          is_sorted = false
          sort_border = i
        end
      end
      break if is_sorted
    end
    self
  end

end
