module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        array = self
        return array if array.empty?

        head, *tail = array 
        
        yield head

        MyArray.new(tail).my_each(&block)
        array
      end

      # Написать свою функцию my_map
      def my_map
        func = ->(acc, el) { acc << yield(el) }
        empty_array = MyArray.new
        my_reduce(empty_array, &func)
      end

      # Написать свою функцию my_compact
      def my_compact
        func = ->(acc, el) { el.nil? ? acc : acc << el }
        empty_array = MyArray.new
        my_reduce(empty_array, &func)
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        arr = self
        arr.my_each do |el|
          acc = if acc.nil?
                   arr.first
                else
                   yield(acc, el)
                end
        end
        acc
      end
    end
  end
end
