module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for i in self
          yield i
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        new_collection = Exercise::Fp2::MyArray.new([])
        for i in self
          new_collection << yield(i)
        end
        new_collection
      end

      # Написать свою функцию my_compact
      def my_compact
        new_collection = Exercise::Fp2::MyArray.new([])
        for i in self
          new_collection << i unless i.nil?
        end
        new_collection
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc_init = nil)
        acc = acc_init
        for i in self
          acc = acc.nil? ? i : yield(acc, i)
        end
        acc
      end
    end
  end
end
