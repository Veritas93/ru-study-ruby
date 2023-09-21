module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        return if empty?

        head, *tail = self

        yield head

        MyArray.new(tail).my_each(&block)
        self
      end

      # Написать свою функцию my_map
      def my_map
        my_reduce(MyArray.new) { |acc, element| acc << yield(element) }
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(MyArray.new) { |acc, element| element.nil? ? acc : acc << element }
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &block)
        return acc if empty?

        head, *tail = self
        new_acc =   acc.nil? ? head : block.call(acc, head)

        MyArray.new(tail).my_reduce(new_acc, &block)
      end
    end
  end
end
