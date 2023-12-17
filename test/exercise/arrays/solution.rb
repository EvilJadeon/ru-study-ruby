module Exercise
  module Arrays
    class << self
      def replace(array)
        array.map do |element|
          element.positive? ? max(array, element) : element
        end
      end

      def search(array, query, low = 0, high = array.length - 1)
        return -1 unless low <= high

        mid = (low + high) / 2
        mid_value = array[mid]

        return mid if mid_value == query
        return mid_value > query ? search(array, query, low, mid - 1) : search(array, query, mid + 1, high)
      end

      private

      def max(array, element)
        array.reduce(element) { |acc, element| acc < element ? element : acc }
      end
    end
  end
end
