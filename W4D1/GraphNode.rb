require 'set'

class GraphNode
  attr_accessor :val, :neighbors

  def initialize(val)
    self.val = val
    self.neighbors = []
  end

  def bfs(starting_node, target_value)
    nodes = [starting_node]
    visited_nodes = Set[]
    until nodes.empty?
        node = nodes.shift 
        if visited_nodes.add?(node) == nil
            break
        end

        puts "FOUND IT! #{target_value}" if node.val == target_value
        return node if node.val == target_value
        nodes.concat(node.neighbors)
    end
    puts "not found"
    nil
  end

end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]
a.bfs(a, "b")
a.bfs(a, "f")