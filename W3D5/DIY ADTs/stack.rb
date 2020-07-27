  class Stack

    def initialize
      @stack = []
    end

    def push(el)
      @stack << el
    end

    def pop
      @stack.pop
      # removes one element from the stack
    end

    def peek
      @stack[-1]
      # returns, but doesn't remove, the top element in the stack
    end
  end