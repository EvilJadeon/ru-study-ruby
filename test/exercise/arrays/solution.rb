module Exercise
  module Arrays
    class << self
      def replace(array)
        new_array = []
        max_element = array.sort.last

        for i in 0..array.length - 1
          modified_element = array[i].positive? ? max_element : array[i]
          new_array << modified_element
        end
        new_array
      end

      def search(array, query, low = 0, high = array.length - 1)
        if low <= high
          mid = (low + high) / 2
          mid_value = array[mid]

          if mid_value == query
            return mid
          elsif mid_value > query
            return search(array, query, low, mid - 1)
          elsif mid_value < query
            return search(array, query, mid + 1, high)
          end
        end
        -1
      end
    end
  end
end
