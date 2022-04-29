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
    p temp.value
  end
  def at(index)
  end
  def pop
  end
  def contains?(value)
  end
  def find(value)
  end
  def to_s
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
# p list.size
p list.head
list.prepend(3)
p list.head
# p list.size
list.prepend(4)
p list.head
# p list.size
list.tail
