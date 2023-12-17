module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(index = 0, &block)
        if index < self.length
          yield self[index]
          my_each(index + 1, &block)
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        my_reduce(MyArray.new([])) do |result, i|
          result << yield(i)
        end
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(MyArray.new([])) do |result, i|
          i.nil? ? result : result << i
        end
      end

      def my_reduce(accumulator = nil, index = 0, &block)
        if index < self.length
          new_accumulator = accumulator.nil? ? self[index] : yield(accumulator, self[index])
          my_reduce(new_accumulator, index + 1, &block)
        else
          accumulator
        end
      end
    end
  end
end
