module Exercise
  module Arrays
    class << self
      def get_max_element(array)
        max_element = array[0]
        for i in array do
          max_element = i if i > max_element
        end
        max_element
      end

      def replace(array)
        max_element_in_array = get_max_element(array)
        result = []
        for i in array do
          new_i = (i.positive? ? max_element_in_array : i)
          result << new_i
        end
        result
      end

      def get_binary_search(array, query, low, higth)
        if array.empty? || low > higth
          -1
        else
          middpoint = ((low + higth) / 2).to_i

          return middpoint if query == array[middpoint]

          if query < array[middpoint]
            new_higth = middpoint - 1
            get_binary_search(array, query, low, new_higth)
          else
            new_low = middpoint + 1
            get_binary_search(array, query, new_low, higth)
          end
        end
      end

      def search(array, query)
        get_binary_search(array, query, 0, array.length - 1)
      end
    end
  end
end
