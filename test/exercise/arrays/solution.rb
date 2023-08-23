module Exercise
  module Arrays
    class << self
      def replace(array)
        array.map { |n| n.positive? ? array.max : n }
      end

      def search(array, query)
        first = 0
        last = array.length - 1

        while first <= last
          i = (first + last) / 2

          if array[i] == query
            return i
          elsif array[i] > query
            last = i - 1
          else
            array[i] < query
            first = i + 1
          end
        end
        -1
      end
    end
  end
end
