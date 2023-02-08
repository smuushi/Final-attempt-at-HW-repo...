class LRUCache

    def initialize
        hash_map = {}
        item_list = 0
    end

    def count

      # returns number of elements currently in cache
    end

    def add(el)
      # adds element to cache according to LRU principle
    end

    def show
      # shows the items in the cache, with the LRU item first
    end

    private
    # helper methods go here!

end

class LinkedList

    def initialize
        @head = nil
        @tail = nil
    end

    def append(value)
        new_node = Node.new(value)
        if @tail == nil && @head == nil
            @head = new_node
            @tail = new_node
        else
            @tail = new_node
        end

    end

    def find_tail
        node = @head

        if node.next =
    end

end

class Node

    attr_accessor :next
    attr_reader :value

    def initialize(value)

        @value = value
        @next = nil
        @previous = nil

    end

end




