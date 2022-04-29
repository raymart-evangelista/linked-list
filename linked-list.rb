# Cell = Struct.new(:value, :next)
# list = Cell.new("head", nil)

# class Entry
#   attr_accessor :next, :data
#   def initialize(data)
#     @next = nil
#     @data = data
#   end
# end

# class List
#   attr_accessor :name
#   def initialize
#     @head = nil
#     @tail = nil
#   end
# end

require 'pry-byebug'
class LinkedList
  
  attr_accessor :head
  # represents the full list
  def initialize
    @head = Node.new
  end

  def append(value)
    if @head.value == nil
      prepend(value)
    else
      # traverse to end of the list
      temp = @head
      until temp.value == nil do temp = temp.next_node end
      # add Node to end
      temp = Node.new(value)
      puts "appeneded."
    end
  end

  def prepend(value)
    # add new node containing value to start of list
    @head = Node.new(value, @head)
    puts "prepended."
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
      until temp.value == nil do
        counter += 1
        temp = temp.next_node
      end
      return counter
    end
  end

  def head
    @head.value
  end

  def tail
    temp = @head
    while temp.next_node.value != nil do
      temp = temp.next_node
    end
    temp.value
  end

  def at(index)
    current = 0
    temp = @head
    until current == index do
      temp = temp.next_node
      current += 1
    end
    temp.value
  end

  def pop
    # traverse to tail of list
    # binding.pry
    temp = @head
    until temp.next_node.value == nil do
      temp = temp.next_node
    end
    # remove tail by making temp nil
    tail = temp
    temp = nil
    tail
  end

  def contains?(value)
    # if LL is empty
    if @head.value == nil
      return false
    else
      temp = @head
      until temp.value == value || temp.value == nil do
        temp = temp.next_node
      end
      if temp.value == nil
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
      until temp.value == value || temp.value == nil do
        index += 1
        temp = temp.next_node
      end
      if temp.value == nil
        return nil
      else
        return index
      end
    end
  end

  def to_s
    temp = @head
    str = ""
    until temp.next_node == nil do
      str << "( #{temp.value} ) -> "
      temp = temp.next_node
    end
    str << "nil"
    p str
  end
end

class Node
  def initialize(value=nil, next_node=nil)
    @value = value
    @next_node = next_node
  end
  def value(value=nil)
    @value
  end
  def next_node(value=nil)
    @next_node
  end    
end


list = LinkedList.new
# p list.size
# p list.head
list.append(2)
list.prepend(3)
list.prepend(4)
list.tail
p list.size
p list.pop
p list.size
p list.contains?(2)
p list.find(2)
p list.find(3)
p list.find(4)
p list.find(5)
list.to_s