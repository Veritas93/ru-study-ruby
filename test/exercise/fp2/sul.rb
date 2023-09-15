class MyArray < Array
  def my_reduce(acc = nil, &block)
    return acc if empty?

    head, *tail = self

    new_acc = acc.nil? ? (block.call(head, tail.first, &block) and tail = tail[1..]) : block.call(acc, head, &block)

    MyArray.new(tail).my_reduce(new_acc, &block)
  end
end
a = MyArray.new([1, 2, 3, 4, 5, 6, 7])

p a.reduce(3) { |sum, element| sum + element }

p a.my_reduce(0) { |sum, element| sum + element }
