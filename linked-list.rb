require 'pry-byebug'
class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = Node.new
    @tail = nil
  end

  def append(value)
    if @head.value.nil?
      prepend(value)
    else
      # if there is no tail node yet, create new tail node and make head point to tail
      if @tail.nil?
        @tail = Node.new(value)
        @head.next_node = @tail
      else
        # because we know the end of our linked lista via tail, create a new node, create a temp pointer to the current tail node, set tail to point to the new node, and since temp pointed to the old tail, we can now point temp to the new tail
        new_node = Node.new(value)
        temp = @tail
        @tail = new_node
        temp.next_node = @tail
      end
      puts "Node appended."
    end
  end

  def prepend(value)
    # add new node containing value to start of list
    @head = Node.new(value, @head)
    puts "Node prepended."

  end

  def size
    # returns total node of nodes in the list
    # base case for empty LL
    if @head.value == nil
      return 0
    # if LL is not empty
    else
      counter = 0
      temp = @head
      # traverse
      until temp.nil? do
        counter += 1
        temp = temp.next_node
      end
      return counter
    end
  end

  def at(index)
    current = 0
    temp = @head
    until current == index do
      temp = temp.next_node
      current += 1
    end
    temp
  end

  def pop
    # new tail becomes the second to last item on the linked list
    temp = @head
    temp = temp.next_node until temp.next_node == @tail
    temp.next_node = nil
    puts "popped last item with value: #{@tail.value}"
    @tail = temp
    
  end

  def contains?(value)
    # if LL is empty
    if @head.value.nil?
      return false
    else
      temp = @head
      until temp.nil? || temp.value == value do
        puts "temp val: #{temp.value}"
        temp = temp.next_node
      end
      if temp.nil?
        return false
      else
        return true
      end
    end
  end

  def find(value)
    if @head.value == nil
      return nil
    else
      index = 0
      temp = @head
      until temp.nil? || temp.value == value do
        index += 1
        temp = temp.next_node
      end
      if temp.nil?
        return nil
      else
        return index
      end
    end
  end

  def to_s
    temp = @head
    str = ""
    until temp == nil do
      str << "( #{temp.value} ) -> "
      temp = temp.next_node
    end
    str << "nil"
    p str
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end


list = LinkedList.new
# p list.size
# p list.head
list.append(2)
list.append(5)
list.append(6)
list.append(34)
list.append(50)
list.prepend(1)
p list.size
p list.head
p list.tail
puts "at index 0: #{list.at(0)}"
puts "at index 5: #{list.at(5)}"
list.to_s
p list.pop
list.to_s
p list.contains?(34)
p list.find(nil)