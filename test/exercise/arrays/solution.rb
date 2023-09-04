module Exercise
  module Arrays
    class << self
      def get_max_element(array)
        max_element = array[0]
        array.each { |element| max_element = element if max_element < element }
        max_element
      end

      def replace(array)
        max_element_in_array = get_max_element(array)
        result = []
        array.each { |element| result << (element.positive? ? max_element_in_array : element) }
        result
      end

      def search(array, query, low = 0, higth = array.length - 1)
        return -1 if array.empty? || array[0] > query || array[- 1] < query || low > higth

        middpoint = ((low + higth) / 2).to_i
        return middpoint if query == array[middpoint]
        return search(array, query, low, middpoint - 1) if query < array[middpoint]
        return search(array, query, middpoint + 1, higth) if query > array[middpoint]
      end
    end
  end
end
