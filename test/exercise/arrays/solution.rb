module Exercise
  module Arrays
    class << self
      def replace(array)
        array.map { |element| element.positive? ? array.max : element }
      end

      def search(array, query)
        current_index = array.index(query)
        current_index.nil? ? -1 : current_index
      end
    end
  end
end
