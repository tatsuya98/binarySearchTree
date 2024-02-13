require 'byebug'

class Tree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def build_tree(array, start, last)
    mid = (start + last) / 2
    return nil if start > last

    node = Node.new(array[mid])
    node.left = build_tree(array, start, mid - 1)
    node.right = build_tree(array, mid + 1, last)
    node
  end

  def insert(value)
    node = @root
    while !node.left.nil? || !node.right.nil?
      if value == node.data
        puts "tree already contains a node with the value #{value}"
        break
      elsif value > node.data
        node = node.right
      else
        node = node.left
      end
    end
    return nil if value == node.data

    node.left = Node.new(value) if node.data > value

    node.right = Node.new(value)
  end
end

class Node
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end
test = Tree.new
arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324].uniq.sort
test.root = test.build_tree(arr, 0, arr.length - 1)
test.insert(324)
