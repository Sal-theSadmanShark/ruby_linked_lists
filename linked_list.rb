class LinkedList
  private

  Node = Struct.new(:value, :next_node)

  def initialize(*item_list)
   empty_list_error if item_list.empty?
    @tail = nil
    @head = Node.new(item_list.first,tail)
    @temp = nil
    assign_items(item_list) if multiple_item?(item_list)
  end

  def assign_items(item_list)
    item_list[1..].each { |item| append(item)}
  end

  def add_first_node(value)
    @tail = Node.new(value,nil)
    @temp = tail
    @head.next_node = tail
  end

  def multiple_item?(item_list)
    item_list.size != 1
  end

  def list_has_tail?
    tail.nil? && temp.nil?
  end

  def empty_list_error
    raise ArgumentError.new('At least one value must be added during creation')
  end

  def last_item_error
    raise ArgumentError.new("List has only one item and can't be deleted")
  end

  def index_error
    raise ArgumentError.new('The given index is out of bounds')
  end

  def loop_nodes_until(condition_string)
    # loop through the nodes until the given expression is met, returns a [index,item] pair
    current_index = 0
    current_node = head
    until eval condition_string
      break if current_node == tail
      current_node = current_node.next_node
      current_index += 1
    end
    [current_index, current_node]
  end

  public

  attr_reader :head, :tail, :temp

  def first
    head.value
  end

  def last
    tail.value
  end

  def append(value)          # add a new item to the end
    if list_has_tail?
      add_first_node(value)
    else
      @temp = Node.new(value,nil)
      @tail.next_node = temp
      @tail = temp
    end
  end

  def prepend(value)         # add a new item to the start
    if list_has_tail?
      add_first_node(value)
    else
      @temp = Node.new(value,head)
      @head = temp
    end
  end

  def size                   #return the size of the list
    loop_nodes_until('current_node.next_node.nil?').first + 1
  end

  def at(index)              # return the item at index
    if index >= size
      index_error
    else
      loop_nodes_until("current_index == #{index}").last.value
    end
  end

  def pop                    # delete last item from list
    if size == 1
      last_item_error
    else
      @tail = loop_nodes_until("current_node.next_node == tail").last
      @tail.next_node = nil
    end
  end

  def shift                  # delete first item from list
    if size == 1
      last_item_error
    else
      @head = head.next_node
    end
  end

  def find(value)            # find the index of item
    return -1 unless contains?(value)
    @temp = value
    loop_nodes_until('current_node.value == temp').first
  end

  def contains?(value)       # check if list contains item
    return true if tail.value == value
    @temp = value
    loop_nodes_until('current_node.value == temp').last != tail
  end

  def to_s                   # print the list as a strinf of (value) -> (value)
    current_node = head
    list_string = "(#{head.value}) -> "
    until current_node == tail || list_has_tail?
      current_node = current_node.next_node
      list_string << "(#{current_node.value}) -> "
    end
    list_string << "nil"
  end

  def insert_at(value,index) # insert new item at the index
    list_length = size
    if index > list_length || index < 0
     index_error
    elsif index == 0
      prepend(value)
    elsif index == list_length
      append(value)
    else
      previous_node = loop_nodes_until("current_index == #{index - 1}").last
      @temp = Node.new(value,previous_node.next_node)
      previous_node.next_node = temp
    end
  end

  def remove_at(index)       # remove the item at index
    list_length = size
    if index >= list_length || index < 0
     index_error
    elsif index == 0
      shift
    elsif index == list_length - 1
      pop
    else
      node_before = loop_nodes_until("current_index == #{index - 1}").last
      node_after = node_before.next_node.next_node
      node_before.next_node = node_after
    end
  end
end




