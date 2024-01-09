module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        return self if self.length.zero?

        yield self[0]
        MyArray.new(self[1..-1]).my_each(&block)
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

      def my_reduce(accumulator = nil, &block)
        return accumulator if self.length.zero?

        new_accumulator = accumulator.nil? ? self[0] : yield(accumulator, self[0])
        MyArray.new(self[1..-1]).my_reduce(new_accumulator, &block)
      end
    end
  end
end
