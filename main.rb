require_relative 'linked_list'
# this file showcases the class and it's methods. feel free to try these yourself

# making a new list
list1 = LinkedList.new(1)
list2 = LinkedList.new(12, 13)
list3 = LinkedList.new(1, 3, 5, 7, 9)
my_langs = LinkedList.new('c++', 'javascript', 'go', 'ruby')

# nodes are instances of Node class which has two attributes,
# list#value and list#next_node
list1.head              # object Id of the first node
list1.head.value        # 1
list1.head.next_node    # nil

list2.tail              # object Idthe last node
list2.tail.value        # 13
list2.head.next_node    # object Id of the last node

# items are the value of nodes which can be viewed with the value method
# or the list#first , list#last and list#at(index) methods
my_langs.first          #'c++'
list3.last              # 9
my_langs.at(2)          # 'go'



# list#to_s returns a string representation of the list
list3.to_s              # "(1) -> (3) -> (5) -> (7) -> (9) -> nil"
my_langs.to_s           # "(c++) -> (javascript) -> (go) -> (ruby) -> nil"

# list#size returns the number of items in the list
my_langs.size           # 4

# list#at(index) returns the item at index or index_error if unavilable
list2.at(1)             # 13

# list#contains?(value) only returnds true if list contains the value
list3.contains? 7       # true

# list#find(value) returns the index if available or -1 if unabailable
my_langs.find('ruby')   # 3



# adding items
# list#append(value) adds an item to the end of the list
list1.append(2)
list1.to_s              # "(1) -> (2) -> nil"
# list#preppend(value) adds an item to the start of the list
list2.prepend(11)
list2.to_s              # "(11) -> (12) -> (13) -> nil"
# list#inser_at(value,index) adds value at the index of the list
list3.insert_at(6,3)
list3.to_s              # "(1) -> (3) -> (5) -> (6) -> (7) -> (9) -> nil"



# removing items
# list#pop removes the last item from the list
list1.pop
list1.to_s            # "(1) -> nil"
# list#shift removes the first item from the list
list2.shift
list2.to_s            # "(12) -> (13) -> nil"
# list#remove_at(index) removes the item at index
list3.remove_at(1)
list3.to_s           # "(1) -> (5) -> (6) -> (7) -> (9) -> nil"
